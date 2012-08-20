package fb.components.renders
{
	import fb.components.labels.IconLabel;
	import fb.events.Dispatcher;
	import fb.events.OpenLinkEvent;
	import fb.model.ReserveVO;
	
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	
	import spark.components.LabelItemRenderer;
	import spark.components.supportClasses.StyleableTextField;
	
	public class ReserveListItemRenderer extends LabelItemRenderer
	{
		private static const LABEL_HEIGHT:uint = 60;
		private static const LABEL_WIDTH:uint = 500;
		private static const GO_TO:String = "Visit ";
		private static const ICON_SOURCE:String =  "assets/dpi160/icons/23-bird.png";
		private static const GO_WEBSITE:String = "Go to website";
		private static const LIMIT:int = 60;
		private var TRUNCATED:String = "...";
		
		private var description:StyleableTextField;
		private var title:IconLabel;
		private var satallite:StyleableTextField;
		private var link:StyleableTextField;
		private var path:String;
		
		public function ReserveListItemRenderer()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			
			if (value == null){
				return;
			}
			
			
			var ro:ReserveVO = value as ReserveVO;
			title.htmlLabelText = GO_TO + "<p>" + ro.title + "</p>"; 
			
			var textWidth:int = title.getHTMLTextLength(); 
			if(textWidth > LIMIT){
			
				var str:String = ro.title;
				str = str.substr(0, LIMIT);
				str = str + TRUNCATED;
				title.htmlLabelText = GO_TO + "<p>" + str + "</p>";
			}
			
				
			description.htmlText = "<p>" + ro.description + "</p>";  
			satallite.htmlText = "<p>" + ro.satellite + "</p>";  
			link.htmlText = "<p><b><font color='#0066CC' size='16' >" + GO_WEBSITE + "</font></b></p>";  
			path = ro.link; 
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
			
			if (!title)
			{
				title = createIconLabel();
				//clabel.styleDeclaration = styleManager.getStyleDeclaration(".stationText1");
				//textLabel.filters = [subtleDropShadow];
			}
			
			if(!description){
				
				description = createTextArea();
				//arrow.visible = false;
			}
			
			if(!satallite){
				
				satallite =  createTextArea();
			}
			
			if(!link){
				
				link = createLinkText();
			}
		}
		
		override protected function commitProperties():void{
			
			title.width    = LABEL_WIDTH;
			title.height   = LABEL_HEIGHT;
			title.iconSource = ICON_SOURCE;
			satallite.width  = LABEL_WIDTH;
			satallite.height = LABEL_HEIGHT;
			description.width     = LABEL_WIDTH;
			description.height    = LABEL_HEIGHT; 
			link.width  = LABEL_WIDTH;
			link.height = LABEL_HEIGHT;
			
			
		}
		
		protected function createIconLabel():IconLabel {
			
			var img:IconLabel = new IconLabel();
			
			//img.addEventListener(MouseEvent.CLICK, handleSelection);
			addChild(img);
			
			return img;
			
		}
		
		
		override protected function layoutContents(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			// layout all the subcomponents here 
			
			title.x = 5;
			title.y = 5;
			
			
			description.x = 5; //unscaledWidth * 0.1;
			description.y = LABEL_HEIGHT + 10;
			
			satallite.x = 5;
			satallite.y = (LABEL_HEIGHT * 2) + 10;
			
			
			link.x = 5;
			link.y = (LABEL_HEIGHT * 3) + 10;
			
			this.height = title.height + description.height + satallite.height + link.height + 10;
			
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
		
		
		
		protected function createTextArea():StyleableTextField{
			
			var ta:StyleableTextField = new StyleableTextField();
			ta.selectable = false;
			ta.multiline = true;
			ta.wordWrap = true;
			
			addChild(ta);
			return ta;
			
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