package fb.components.renders
{
	import fb.components.labels.IconLabel;
	import fb.model.AccomodationVO;
	import fb.model.ListVO;
	
	import flash.filters.DropShadowFilter;
	import fb.events.Dispatcher;
	import fb.events.OpenLinkEvent;
	import flash.text.AntiAliasType;
	import flash.events.MouseEvent;
	
	import spark.components.Image;
	import spark.components.Label;
	import spark.components.LabelItemRenderer;
	import spark.components.TextArea;
	import spark.components.VGroup;
	import spark.components.supportClasses.StyleableTextField;
	import spark.core.ContentCache;
	import spark.primitives.BitmapImage;
	
	public class AccomodationListItemRenderer extends LabelItemRenderer
	{
		
		private static const GO_TO:String = "Visit ";
		//private static const IL_WIDTH:int = 120;
		private static const IL_HEIGHT:int = 60;
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
		private var _iconSource:String =  "assets/dpi160/icons/home.png";
		private static const GO_WEBSITE:String = "Go to website";
		private  var _imageCache:ContentCache;
		private var link:StyleableTextField;
		private var path:String;
		
		private var textDisplay:StyleableTextField;
		private var title:StyleableTextField;
		private var subtleDropShadow:DropShadowFilter = new DropShadowFilter(2,45,0,0.8, 2, 2);
		private var icon:IconLabel;
		
		
		public function AccomodationListItemRenderer()
		{
			super();
			
			makeCachedImages();
			
			
			
		}
		
	
	private function makeCachedImages():void{
	

		
	}
		override public function set data(value:Object):void
		{
			super.data = value;
			
			if (value == null){
				return;
			}
			
			icon.htmlLabelText = "<p>" + GO_TO + value.title + "</p>";
		
			textDisplay.htmlText = "<p>" + value.description + "</p>";  
			link.htmlText = "<p><b><font color='#0066CC' size='16' >" + GO_WEBSITE + "</font></b></p>";  
			path = value.link; 
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
			
			/*if (!title)
			{
				title = createLabel();
				//clabel.styleDeclaration = styleManager.getStyleDeclaration(".stationText1");
				//textLabel.filters = [subtleDropShadow];
			}*/
			
			if(!textDisplay){
				
				textDisplay = createTextArea();
				//arrow.visible = false;
			}
			
			if(!icon){
				
				icon = createIcon();
			}
			
			if(!link){
				
				link = createLinkText();
			}
			
		}
	
		override protected function commitProperties():void{
			
		//icon.source = IMG_SOURCE;
			icon.iconSource = iconSource;	
			icon.width = LABEL_WIDTH;  
			icon.height = IL_HEIGHT;
			textDisplay.width = LABEL_WIDTH;
			//icon.labelText = GO_TO + title.text;
			link.width  = LABEL_WIDTH;
			link.height = LABEL_HEIGHT;
			
		}
		override protected function layoutContents(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			// layout all the subcomponents here 
			
			icon.x = 5;
			icon.y = 5 ;

			textDisplay.x = 5; //unscaledWidth * 0.1;
			textDisplay.y = IL_HEIGHT + 20;
			
			link.x = 5;
			link.y = IL_HEIGHT * 3;
			
			this.height = textDisplay.height + icon.height + link.height +  15; //title.height + 
			
		}
		
		
		override protected function drawBackground(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			//super.drawBackground(unscaledWidth, unscaledHeight);
			
			//	trace("draw background " + unscaledWidth + "  " + unscaledHeight);
			// do any drawing for the background of the item renderer here   
			graphics.beginFill(0xa10c11,0);
			graphics.drawRect(0,0,100,10);
			graphics.endFill(); 
			
				graphics.beginFill(0xa10c11,0);
				graphics.drawRect(0,unscaledHeight,100,10);
				graphics.endFill(); 
			
			
		}
	
		// Override measure() to calculate the size required by the item renderer.
		override protected function measure():void {
			// Measure the labelDisplay by calling super.measure()
			super.measure();
			
			// Then consider the compLabelDisplay if it exists.
		/*	if (textDisplay)
			{
				var horizontalPadding:Number = getStyle("paddingLeft") + getStyle("paddingRight");
				var verticalPadding:Number = getStyle("paddingTop") + getStyle("paddingBottom");
				
				// Commit the styles changes to compLabelDisplay. 
				// This method must be called before the text is displayed, 
				// and any time the styles have changed. 
				// This method does nothing if the styles have already been committed. 
				title.commitStyles();
				measuredWidth =  Math.max(getElementPreferredWidth(labelDisplay), getElementPreferredWidth(textDisplay))
				measuredWidth += horizontalPadding;
				
				measuredHeight =  getElementPreferredHeight(labelDisplay);
				measuredHeight += getElementPreferredHeight(textDisplay);
				measuredHeight += verticalPadding + 10; //verticalGap;
			}*/
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
		
		protected function createIcon():IconLabel {
			
			var img:IconLabel = new IconLabel();
			
			//img.addEventListener(MouseEvent.CLICK, handleSelection);
			addChild(img);
			
			return img;
			
		}
		
		protected function createTextArea():StyleableTextField{
			
			var ta:StyleableTextField = new StyleableTextField();
			ta.selectable = false;
			ta.multiline = true;
			ta.wordWrap = true;
			
			addChild(ta);
			return ta;
			
		}

		public function get iconSource():String
		{
			return _iconSource;
		}

		public function set iconSource(value:String):void
		{
			_iconSource = value;
		}
		
		protected function createLinkText():StyleableTextField{
			
			var ta:StyleableTextField = new StyleableTextField();
			ta.selectable = false;
			ta.multiline = true;
			ta.wordWrap = true;
			ta.addEventListener(MouseEvent.CLICK, openLink);
			addChild(ta);
			return ta;
			
		}
		
		private function openLink(e:MouseEvent):void{
			
			var eve:OpenLinkEvent = new OpenLinkEvent(OpenLinkEvent.OPEN_LINK);
			eve.path = path;
			
			Dispatcher.dispatch(eve);
		}

	}
}