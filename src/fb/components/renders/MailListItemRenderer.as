package fb.components.renders
{
	import fb.model.MailingListVO;
	
	import flash.text.AntiAliasType;
	import fb.events.Dispatcher;
	import fb.events.OpenLinkEvent;
	import flash.events.MouseEvent;
	
	import spark.components.LabelItemRenderer;
	import spark.components.supportClasses.StyleableTextField;
	
	public class MailListItemRenderer extends LabelItemRenderer
	{
		
		private static const LABEL_HEIGHT:uint = 40;
		private static const LABEL_WIDTH:uint = 400;
		private static const GO_WEBSITE:String = "Go to website";
		private var groupEmail:StyleableTextField;
		private var title:StyleableTextField;
		private var personEmail:StyleableTextField;
		private var link:StyleableTextField;
		private var path:String;
		
		
		public function MailListItemRenderer()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			
			if (value == null){
				return;
			}
			
			
			var mo:MailingListVO = value as MailingListVO;
			title.htmlText = "<p>" + mo.title + "</p>"; 
			personEmail.htmlText = "<p>" + mo.person_email+ "</p>";  
			groupEmail.htmlText = "<p>" + mo.group_email + "</p>";  
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
				title = createLabel();
				//clabel.styleDeclaration = styleManager.getStyleDeclaration(".stationText1");
				//textLabel.filters = [subtleDropShadow];
			}
			
			if(!personEmail){
				
				personEmail = createTextArea();
				//arrow.visible = false;
			}
			
			if(!groupEmail){
				
				groupEmail =  createTextArea();
			}
			
			if(!link){
				
				link = createLinkText();
			}
		}
		
		override protected function commitProperties():void{
			
			title.width    = LABEL_WIDTH;
			title.height   = LABEL_HEIGHT;
			groupEmail.width  = LABEL_WIDTH;
			groupEmail.height = LABEL_HEIGHT;
			personEmail.width     = LABEL_WIDTH;
			personEmail.height    = LABEL_HEIGHT; 
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
			
			
			personEmail.x = 5; //unscaledWidth * 0.1;
			personEmail.y = LABEL_HEIGHT + 10;
			
			groupEmail.x = 5;
			groupEmail.y = (LABEL_HEIGHT * 2) + 10;
			
			
			link.x = 5;
			link.y = (LABEL_HEIGHT * 3) + 10;
			
			this.height = title.height + personEmail.height + groupEmail.height + link.height + 10;
			
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
			
			var eve:OpenLinkEvent = new OpenLinkEvent(OpenLinkEvent.OPEN_EMAIL);
			eve.path = path;
			
			Dispatcher.dispatch(eve);
		}
	}
}