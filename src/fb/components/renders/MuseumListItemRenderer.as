package fb.components.renders
{
	import fb.components.labels.IconLabel;
	import fb.events.Dispatcher;
	import fb.events.OpenLinkEvent;
	import fb.model.MuseumVO;
	
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	
	import spark.components.LabelItemRenderer;
	import spark.components.supportClasses.StyleableTextField;
	
	
	public class MuseumListItemRenderer extends LabelItemRenderer
	{
		private static const LABEL_HEIGHT:uint = 60;
		private static const LABEL_WIDTH:uint = 400;
		private static const GO_WEBSITE:String = "Go to website";
		private var description:StyleableTextField;
		private var title:IconLabel;
		
		private var link:StyleableTextField;
		private var path:String;
		
		public function MuseumListItemRenderer()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			
			if (value == null){
				return;
			}
			
			
			var mo:MuseumVO = value as MuseumVO;
			title.htmlLabelText = "<p>" + mo.title + "</p>"; 
			description.htmlText = "<p>" + mo.description + "</p>";  
			link.htmlText = "<p><b><font color='#0066CC' size='16' >" + GO_WEBSITE + "</font></b></p>";  
			path = mo.link;
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

			
			if(!link){
				
				link = createLinkText();
			}
		}
		
		override protected function commitProperties():void{
			
			title.width    = LABEL_WIDTH;
			title.height   = LABEL_HEIGHT;

			description.width     = LABEL_WIDTH;
			description.height    = LABEL_HEIGHT; 
			link.width  = LABEL_WIDTH;
			link.height = LABEL_HEIGHT;
			
			
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
			
	        link.x = 5;
			link.y = (LABEL_HEIGHT * 2) + 10;
			
			this.height = title.height + description.height + link.height + 10;
			
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
		
		protected function createIconLabel():IconLabel {
			
			var img:IconLabel = new IconLabel();
			
			//img.addEventListener(MouseEvent.CLICK, handleSelection);
			addChild(img);
			
			return img;
			
		}
		
		private function openLink(e:MouseEvent):void{
			
			var eve:OpenLinkEvent = new OpenLinkEvent(OpenLinkEvent.OPEN_LINK);
			eve.path = path;
			
			Dispatcher.dispatch(eve);
		}
	}
}