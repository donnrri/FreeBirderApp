package fb.components.renders
{
	
	import fb.events.OptionsEvent;
	import fb.events.Dispatcher;
	import fb.model.DayVO;
	import fb.model.ReserveVO;
	
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	
	import spark.components.Button;
	import spark.components.HGroup;
	import spark.components.Image;
	import spark.components.LabelItemRenderer;
	import spark.components.VGroup;
	import spark.components.supportClasses.StyleableTextField;
	import spark.primitives.BitmapImage;
	
	public class CalendarListItemRenderer extends LabelItemRenderer
	{
		
		private static const LABEL_HEIGHT:uint = 50;
		private static const LABEL_WIDTH:uint =  160;
		private static const SUMMARY:String = "Details";
		private static const ACC_PATH:String = "assets/dpi160/icons/home.png";
		private static const RES_PATH:String = "assets/dpi160/icons/23-bird.png";
		
		private var labelCount:int = 1;
		private var date:StyleableTextField;
		private var sum:Button;
		private var accomodation:StyleableTextField;
		private var tour:StyleableTextField;
		private var reserves:StyleableTextField;
		private var observatory:StyleableTextField;
		private var museums:StyleableTextField;
		private var maillist:StyleableTextField;
		private var festival:StyleableTextField;
		
		private var accIcon:Image;
		private var resIcon:Image;
		private var musIcon:Image;
		private var obsIcon:Image;
		private var tourIcon:Image;
		
		
		private var currentAcc:String;
		private var currentObs:String;
		private var currentRes:Vector.<ReserveVO>;
		private var currentTour:String;
		private var currentMus:String;
		private var currentFes:String;
		private var hg:HGroup = new HGroup();
		private var images:Vector.<Image>;
		private var drawCoords:Vector.<Number> = new Vector.<Number>();
		
		private var drawCommands:Vector.<int> = new Vector.<int>();
		
		private var day:DayVO;

		private var currentX:int = 5;
		private var curentY:int;
		
		public function CalendarListItemRenderer()
		{
			super();
			
			trace("label count -> " + labelCount);
			
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			
			if (value == null){
				return;
			}
			
			
			
			 day = value as DayVO;
			setProperties(day);
			date.htmlText = "<p>" + day.day + "/" + day.month + "</p>"; 
			// trace(date.htmlText + " ******* ACCOMODATON ==== " + accomodation);
			 
			 
			
		}
		
		
		private function setProperties(day:DayVO):void{
	
		  images  = new Vector.<Image>();
			
		//	makeGrid();
			if( day.accomodation != null){
				
			   if(!accomodation){
				   var accIcon:Image = new Image();
				   accIcon = makeIcon(ACC_PATH);
				//  addToGrid(ACC_PATH, labelCount);
				/*   accIcon.x = currentX;
				   accIcon.y = setYcoord();*/
				   images.push(accIcon);
			   }
				

			}
			
			
			if( day.reserves.length > 0){
				
				if(!reserves){
				  // addToGrid(RES_PATH,  labelCount);
					var resIcon:Image = new Image();
					resIcon = makeIcon(RES_PATH);
					images.push(resIcon);
				}
				
				currentRes = day.reserves;
				
			}
			
			
		}
		

		
		private function addToGrid(images:Vector.<Image>, width:Number, height:Number):void{
			
			var limit:int = images.length;  
			var imgInt:int = 40;
			var xVal:int = (width  - 40) /4;
			var yVal:int = (height - 40) /4;
		    var counter:int = 1;
			for(var i:int = 0; i < limit; ++i){
				
				
					
					imgInt= imgInt * counter;
				
				if(i > 0){
					
					counter  = 1;
					xVal = width - ((width  - 40) /2);
					
					if(i > 1){
						
						yVal = height - ((height  - 40) /2);
					}
				}
				images[i].x = xVal;
				images[i].y = yVal;
			
				addChild(images[i]);
				counter++;
			}
		}
		
		private function makeIcon(path:String):Image {
			        var img:Image = new Image();
					img.source = path;
					img.width = 40;
					img.height = 40;
					//img.addEventListener(MouseEvent.CLICK, handleSelection);
					//addChild(img);
					return img;
		}
		
		private function handleSelection(e:MouseEvent):void{
			
			var eve:OptionsEvent = new OptionsEvent(OptionsEvent.DAY_INFORMATION);
			eve.dayObject = day;
			
			Dispatcher.dispatch(eve);
			
		}
	
		

	
		/**
		 * @private
		 * 
		 * Override this method to create children for your item renderer 
		 */	
		override protected function createChildren():void
		{
			
			//super.createChildren();
			// create any additional children for your item renderer here
	
			
			if (!date)
			{
				date = createLabel();
				//clabel.styleDeclaration = styleManager.getStyleDeclaration(".stationText1");
				//textLabel.filters = [subtleDropShadow];
			}
			
			if(!sum){
				
				sum = createButton();
			}
			

		}
		
		override protected function commitProperties():void{
			
			date.width    = LABEL_WIDTH;
			date.height   = LABEL_HEIGHT;
			sum.label = SUMMARY;
			
		}
		
		
		override protected function layoutContents(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			// layout all the subcomponents here 
			
			date.x = 5;
			date.y = 5;
			this.height = date.height * 6;
		    this.width = date.width * 2;
			
			sum.x = (this.width - 5) - sum.width;
			sum.y = 5;
			
			addToGrid(images, unscaledWidth, unscaledHeight);
			drawSquare(this.width, this.height);
		}
		
		protected function drawSquare(width:Number, height:Number):void{
			
			var w:Number = width -2;
			var h:Number = height -2;
			
			drawCoords.push(2,2); drawCoords.push(w, 2); drawCoords.push(w, 2);drawCoords.push(w, h); drawCoords.push(w, h);drawCoords.push(2,h);
			drawCoords.push(2,h);drawCoords.push(2,2);
			drawCommands.push(1,2,3,4);
			graphics.lineStyle(1,0x003f48, 0.8);
			graphics.drawPath(drawCommands, drawCoords);
			
			
		}
		protected function createLabel():StyleableTextField
		{
			
			var lbl:StyleableTextField = StyleableTextField(createInFontContext(StyleableTextField));
			
			lbl.antiAliasType = AntiAliasType.NORMAL;
			//lbl.addEventListener(MouseEvent.CLICK, handleSelection);
			lbl.selectable = false;
			lbl.multiline = true;
			lbl.wordWrap = true;
			
			//lbl.styleDeclaration = styleManager.getStyleDeclaration(".countryLabel");
			
			addChild(lbl);
			lbl.commitStyles();
			
			return lbl;
		}
		
		protected function createNewLabel():StyleableTextField
		{
			
			var lbl:StyleableTextField = StyleableTextField(createInFontContext(StyleableTextField));
			
			lbl.antiAliasType = AntiAliasType.NORMAL;
			//lbl.addEventListener(MouseEvent.CLICK, handleSelection);
			lbl.selectable = false;
			lbl.multiline = true;
			lbl.wordWrap = true;
			lbl.text = "";
			//lbl.styleDeclaration = styleManager.getStyleDeclaration(".countryLabel");
			var num:int = this.numChildren;
			addChildAt(lbl, num);
			lbl.commitStyles();
			
			return lbl;
		}
		
		private function createButton():Button{
			
			var b:Button = new Button();
			b.width = 80;
			b.height = 30;
			b.addEventListener(MouseEvent.CLICK, handleSelection);
			addChild(b);
			return b;
		}
	}
}