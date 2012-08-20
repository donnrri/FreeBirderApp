package fb.components.renders
{
	import fb.events.Dispatcher;
	import fb.events.GroupDataEvent;
	import fb.events.ItemSelectionEvent;
	import fb.model.CountryVO;
	import fb.model.RegionVO;
	
	import flash.display.Bitmap;
	import flash.display.GradientType;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.text.AntiAliasType;
	
	import mx.core.BitmapAsset;
	import mx.core.FlexGlobals;
	import mx.effects.Fade;
	import mx.effects.Parallel;
	import mx.styles.StyleManager;
	
	import spark.components.DataGroup;
	import spark.components.Image;
	import spark.components.LabelItemRenderer;
	import spark.components.VGroup;
	import spark.components.supportClasses.StyleableTextField;
	import spark.core.ContentCache;
	import spark.effects.Resize;
	/**
	 * 
	 * ASDoc comments for this item renderer class
	 * 
	 */
	public class CountryListRenderer extends LabelItemRenderer
	{
		
		
		[Embed(source="/assets/dpi160/icons/arrow_down15.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var downArrow:Class;
		
		[Embed(source="/assets/dpi160/icons/add15.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var plusSign:Class;
		
		private static const IMG_WIDTH:int = 35;
		private static const IMG_HEIGHT:int = 35;
		private static const PLUS_WIDTH:int = 15;
		private static const PLUS_HEIGHT:int = 15;
		private static const LABEL_HEIGHT:uint = 40;
		private static const LABEL_WIDTH:uint = 400;
		private static const FADE_DURATION:uint = 300;
		private static const RESIZE_DURATION:uint = 300;
		private static const XOFFSET:uint = 10;
		private static const BOTTOM_PADDING:uint = 2;
		private static const MAX_CACHE:uint = 100;
		private static const X_ELIPSE:uint = 30;
		private static const Y_ELIPSE:uint = 30;
		
		
		private static const COUNTRY:String = "country";
		private static const REGION:String = "region";
		
		private static const ASSET_STR:String = "assets/flags/";
		
		private static var _imageCache:ContentCache;
		private var selectedItem:Boolean = false;
		private var isOpen:Boolean = false;
		private var hasRegions:Boolean = false;
		private var originalW:Number;
		private var originalH:Number;
		private var labelCount:uint;

		
		
		protected var textLabel:StyleableTextField;
		//private var subtleDropShadow:DropShadowFilter = new DropShadowFilter(2,45,0,0.8, 2, 2);
		private var icon:Image;
		private var plus:Image;
		private var arrow:Image;
		private var dataGroup:VGroup;
		
		
		public function CountryListRenderer()
		{
			//TODO: implement function
			super();
			
			if (_imageCache == null) {
					_imageCache = new ContentCache();
					_imageCache.enableCaching = true;
					 _imageCache.maxCacheEntries = MAX_CACHE;
				           
			}
			this.setStyle("downColor", 0x0033CC);
			this.setStyle("selectionColor", 0x0033CC);
			
			Dispatcher.addEventListener(GroupDataEvent.CLOSE_DATA, closeOpen);
			
			/*
			If you want to manipulate the embbeded image use this 
			downArrow = new downArrow() as BitmapAsset;
			addSign= new plusSign() as BitmapAsset;
			---- now manipulate the image
			---- if not just use embedded image as source for the image
			*/

		}
		
		/**
		 * @private
		 *
		 * Override this setter to respond to data changes
		 */
		override public function set data(value:Object):void
		{
			
			super.data = value;
			
			if (value == null){
				return;
			}
			    
			    var obj:CountryVO = value as CountryVO;
				textLabel.text  = obj.name;
				icon.source = ASSET_STR + obj.icon;
				
				if(obj.regions.regions.length > 0){
					
					makeRegions(obj.regions);
					plus.source = plusSign;
					arrow.source = downArrow;
					hasRegions = true;
					
				}
				
				else{
					
			        removeChild(plus);
					removeChild(arrow);
					hasRegions = false;
				}
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
			
			if (!textLabel)
			{
				textLabel = createLabel();
				//clabel.styleDeclaration = styleManager.getStyleDeclaration(".stationText1");
				//textLabel.filters = [subtleDropShadow];
			}
			
			if(!icon){
				
				icon = createIcon();
			}
			
			if(!plus){
				
				plus = createSign();
			}
			
			if(!arrow){
				
				arrow = createSign();
				//arrow.visible = false;
			}
			
			//addGroup()
		}
		
		protected function makeRegions(obj:RegionVO):void{
			
			dataGroup = new VGroup();
			dataGroup.id = "dataGroup";
			dataGroup.y = textLabel.height/2;
			dataGroup.visible = false;
			addChild(dataGroup);
			
			labelCount = obj.regions.length;
			addLabels(labelCount, obj)
			
		}
		
		protected function addLabels(count:uint, obj:RegionVO):void{
			
			
			for(var i:int = 0; i < count; i++){
				
				var lbl:StyleableTextField = StyleableTextField(createInFontContext(StyleableTextField));
				lbl.editable = false;
				lbl.selectable = false;
				lbl.multiline = false;
				lbl.wordWrap = false;
				lbl.antiAliasType = AntiAliasType.NORMAL;
				lbl.width = LABEL_WIDTH;
				lbl.height = LABEL_HEIGHT;
				lbl.x = IMG_WIDTH + XOFFSET;
				lbl.addEventListener(MouseEvent.CLICK, handleRegionSelect)
				
				lbl.y = i * LABEL_HEIGHT;
				lbl.text = obj.regions[i]; 
				lbl.name = lbl.text;
				lbl.styleDeclaration = styleManager.getStyleDeclaration(".countryLabel");
				
				dataGroup.addElement(lbl);
				lbl.commitStyles();
				
			}
		}
		
		/**
		 * @private
		 * 
		 * Override this method to change how the item renderer 
		 * sizes itself. For performance reasons, do not call 
		 * super.measure() unless you need to.
		 */ 
		override protected function measure():void
		{
			super.measure();
			// measure all the subcomponents here and set measuredWidth, measuredHeight, 
			// measuredMinWidth, and measuredMinHeight      		
		}
		
		/**
		 * @private
		 * 
		 * Override this method to change how the background is drawn for 
		 * item renderer.  For performance reasons, do not call 
		 * super.drawBackground() if you do not need to.
		 */
		override protected function drawBackground(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			super.drawBackground(unscaledWidth, unscaledHeight);
			var awidth:Number = FlexGlobals.topLevelApplication.width;
		//	trace("draw background " + unscaledWidth + "  " + unscaledHeight);
			// do any drawing for the background of the item renderer here   
			if(!isOpen){
			var colors:Array = [0xF3F4F6, 0xF3F4FF];//F3F4F
			var alphas:Array = [1, 1];
			var ratios:Array = [0, 255];
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(LABEL_WIDTH, unscaledHeight, Math.PI / 2, 0, 0);
			graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matrix);
			graphics.drawRoundRect(0, 0,(awidth-50), unscaledHeight,X_ELIPSE, Y_ELIPSE);//LABEL_WIDTH
			graphics.endFill();
			
			graphics.beginFill(0xCCCCCC);
			graphics.drawRect(25, unscaledHeight - 1, awidth-100, 1);//LABEL_WIDTH
			graphics.endFill(); 
			}
			
			else{
				
				var colorsOpen:Array = [0xF3F4F6, 0xF3F4F6];
				var alphasOpen:Array = [1, 1];
				var ratiosOpen:Array = [0, 255];
				var matrixOpen:Matrix = new Matrix();
				matrixOpen.createGradientBox(LABEL_WIDTH, LABEL_HEIGHT, Math.PI / 2, 0, 0);
				graphics.beginGradientFill(GradientType.LINEAR, colorsOpen, alphasOpen, ratiosOpen, matrixOpen);
				graphics.drawRoundRect(0, 0,LABEL_WIDTH, LABEL_HEIGHT, X_ELIPSE, Y_ELIPSE);
				graphics.endFill();
				
				graphics.beginFill(0xCCCCCC);
				graphics.drawRect(0, unscaledHeight - 1, LABEL_WIDTH, 1);
				graphics.endFill(); 
			
			
			}
			
			// draw the vertical separator between the label and artist
			if (!down && !selected){
				//DRAW TRIANGLE POITING DOWN  FADE IN 
			}
		}
		
		/**
		 * @private
		 *  
		 * Override this method to change how the background is drawn for this 
		 * item renderer. For performance reasons, do not call 
		 * super.layoutContents() if you do not need to.
		 */
		override protected function layoutContents(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			// layout all the subcomponents here 
			
			originalW = unscaledWidth;
			originalH = unscaledHeight;
			
			var yVal:Number =  (LABEL_HEIGHT - IMG_HEIGHT) * 0.5;
			var yInd:Number =   (LABEL_HEIGHT - PLUS_HEIGHT) * 0.5;
			icon.x = 5;
			icon.y = yVal;
			
			textLabel.x = IMG_WIDTH + XOFFSET;
			textLabel.y = yVal;
			
			textLabel.width = LABEL_WIDTH;;
			textLabel.height = LABEL_HEIGHT;
			
			plus.x = LABEL_WIDTH - IMG_WIDTH;
			plus.y = yInd;
			
			arrow.x = LABEL_WIDTH - IMG_WIDTH;
			arrow.y = yInd;
			
		}

		
		override protected function commitProperties():void{
			
			plus.visible  = (!isOpen) ? true : false;
			arrow.visible  = (!isOpen) ? false : true;
		}
		
		protected function createLabel():StyleableTextField
		{
			
			var lbl:StyleableTextField = StyleableTextField(createInFontContext(StyleableTextField));
			lbl.editable = false;
			lbl.selectable = false;
			lbl.multiline = false;
			lbl.wordWrap = false;
			lbl.antiAliasType = AntiAliasType.NORMAL;
            lbl.addEventListener(MouseEvent.CLICK, handleSelection);
			
			lbl.styleDeclaration = styleManager.getStyleDeclaration(".countryLabel");
			
			addChild(lbl);
			lbl.commitStyles();
			
			return lbl;
		}
		
		protected function createIcon():Image {
			
			var img:Image = new Image();
			img.smooth = true;
			img.contentLoader = _imageCache;
			img.width = IMG_WIDTH;
			img.height = IMG_HEIGHT;
			img.addEventListener(MouseEvent.CLICK, handleSelection);
			addChild(img);
			
			return img;
		
		}
		
		protected function createSign():Image {
			
			var img:Image = new Image();
			img.smooth = true;
			img.contentLoader = _imageCache;
			img.width = PLUS_WIDTH;
			img.height = PLUS_HEIGHT;
			img.addEventListener(MouseEvent.CLICK, handleSelection);
			addChild(img);
			
			return img;
		  }

		
		
		private function handleSelection(e:MouseEvent):void{
			
			selectedItem = true;
			
			var data:String = textLabel.text;
	        sendAlert(COUNTRY, data);
		    var rendererEvent:GroupDataEvent = new GroupDataEvent(GroupDataEvent.OPEN_DATA);
			rendererEvent.position = this.itemIndex;
			Dispatcher.dispatch(rendererEvent);
			
			
			if(labelCount > 0){
				
				openElement();
			}
		
		}
		
		
		private function handleRegionSelect(e:MouseEvent):void{
			
			var data:String = e.target.name;
			sendAlert(REGION, data);
			trace(e.target.name);
		}
		

		
		private function openElement():void{
			
			if(selectedItem){
				
				if(isOpen){
					
					fadeClose();
					}
				
				else{
					
					fadeOpen();
					var rendererEvent:GroupDataEvent = new GroupDataEvent(GroupDataEvent.OPEN_DATA);
					Dispatcher.dispatch(rendererEvent);
				}
			}
			
			dataGroup.visible = true;
           
		}
		

		
		private function fadeOpen():void{
			
			
			var fade:Fade  = new Fade();
			var res:Resize = new Resize();
			var p:Parallel =new Parallel();
			
			res.duration = RESIZE_DURATION;
			res.heightFrom = originalH;
			res.heightTo = ((labelCount + BOTTOM_PADDING)* LABEL_HEIGHT);
			res.target = this;
			
			
			fade.duration = FADE_DURATION;
			fade.target = dataGroup;
			fade.alphaFrom = 0;
			fade.alphaTo = 1;
			
			p.addChild(fade);
			p.addChild(res);
				
		    p.play();
			
			selectedItem = false;
			isOpen = true;
			
			dataGroup.height = (labelCount * LABEL_HEIGHT);
			
			
			
		}
		
		private function closeOpen(e:GroupDataEvent):void{
			
			if(isOpen){
				
				if(!selectedItem){
					
					fadeClose();
				}
			}
		}
		
		private function fadeClose():void{
			
			
			var fade:Fade  = new Fade();
			var res:Resize = new Resize();
			var p:Parallel =new Parallel();
			
			res.duration = RESIZE_DURATION;
			res.heightFrom = dataGroup.height;
			res.heightTo = LABEL_HEIGHT;
			res.target = this;
			
			
			fade.duration = FADE_DURATION;
			fade.target = dataGroup;
			fade.alphaFrom = 1;
			fade.alphaTo = 0;
			
			p.addChild(fade);
			p.addChild(res);
			
			p.play();
			
		    selectedItem = false;
			isOpen = false;
		}
		
		
		private function sendAlert(type:String, data:String):void{
			
			var eve:ItemSelectionEvent;
			
			if(type == COUNTRY){
				
				if(!hasRegions){
					
					eve = new ItemSelectionEvent(ItemSelectionEvent.COUNTRY_SELECTED);
					eve.itemStr = data;
					eve.itemType = type;
					Dispatcher.dispatch(eve);
				}
			}
			
			if(type == REGION){
				
				if(hasRegions){
					
					eve = new ItemSelectionEvent(ItemSelectionEvent.REGION_SELECTED);
					eve.itemStr = data;
					eve.itemType = type;
					Dispatcher.dispatch(eve);
				}
			}
			
			
		}
	}
}