package fb.components.renders
{
	import fb.components.labels.IconLabel;
	import fb.model.TourVO;
	
	import flash.text.AntiAliasType;
	
	import spark.components.LabelItemRenderer;
	import spark.components.supportClasses.StyleableTextField;
	
	public class TourListItemRenderer extends LabelItemRenderer
	{
		private static const LABEL_HEIGHT:uint = 40;
		private static const LABEL_WIDTH:uint = 400;
		private static const GO_TO:String = "Visit ";
		private static const ICON_SOURCE:String =  "assets/dpi160/icons/71-compass.png";
		
		private var contact:StyleableTextField;
		private var title:IconLabel;
		private var type:StyleableTextField;
		private var service:StyleableTextField;
		
		public function TourListItemRenderer()
		{
			super();
		}
		
		
		
		override public function set data(value:Object):void
		{
			super.data = value;
			
			if (value == null){
				return;
			}
			
			
			var to:TourVO = value as TourVO;
			title.htmlLabelText = "<p>" + to.title + "</p>"; 
			contact.htmlText = "<p>" + to.contact + "</p>";  
			type.htmlText = "<p>" + to.description + "</p>";  
			service.htmlText = "<p>" + to.service + "</p>";  
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
			
			if(!type){
				
				type = createTextArea();
				//arrow.visible = false;
			}
			
			if(!service){
				
				service =  createTextArea();
			}
			
			if(!contact){
				
				contact = createLabel();
			}
		}
			
			override protected function commitProperties():void{
				
			    title.width    = LABEL_WIDTH;
				title.height   = LABEL_HEIGHT;
				//service.width  = LABEL_WIDTH;
				//service.height = LABEL_HEIGHT;
				type.width     = LABEL_WIDTH;
				type.height    = LABEL_HEIGHT; 
				contact.width  = LABEL_WIDTH;
				contact.height = LABEL_HEIGHT;
				
				
			}
			
			
			override protected function layoutContents(unscaledWidth:Number, 
													   unscaledHeight:Number):void
			{
				super.layoutContents(unscaledWidth, unscaledHeight);
				// layout all the subcomponents here 
				
				title.x = 5;
				title.y = 5;
				
				
				service.x = 5; //unscaledWidth * 0.1;
				service.y = LABEL_HEIGHT + 10;
				
				type.x = 5;
				type.y = (LABEL_HEIGHT * 2) + 10;
				
				
				contact.x = 5;
				contact.y = (LABEL_HEIGHT * 3) + 10;
				this.height = title.height + type.height + service.height + contact.height + 10;
				
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
			
			protected function createIconLabel():IconLabel {
				
				var img:IconLabel = new IconLabel();
				
				//img.addEventListener(MouseEvent.CLICK, handleSelection);
				addChild(img);
				
				return img;
				
			}
		
	}
}