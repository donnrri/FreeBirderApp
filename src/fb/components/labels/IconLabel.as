package fb.components.labels
{
	import flash.text.AntiAliasType;
	
	import mx.core.IFactory;
	
	import spark.components.Group;
	import spark.components.Image;
	import spark.components.SkinnableContainer;
	import spark.components.supportClasses.StyleableTextField;
	import spark.primitives.BitmapImage;
	
	public class IconLabel extends SkinnableContainer implements IFactory
	{
		
		private var textLabel:StyleableTextField;
		private var icon:BitmapImage;
		private var _htmlLabelText:String;
		private var _labelText:String;
		private var _iconSource:String;
		
		
		public function IconLabel()
		{
			super();
		}
		
		public function newInstance():*
		{
			return null;
		}
		
		override protected function createChildren():void
		{
			// TODO Auto Generated method stub
			super.createChildren();
			if (!textLabel)
			{
				textLabel = createLabel();
				
				
			}
			
			if(!icon){
				
				icon = createIcon();
			}
			
		}
		
		override protected function commitProperties():void
		{
			if(labelText != null){
				
				textLabel.text = _labelText;
			}
			
			if(htmlLabelText != null){
				
				textLabel.htmlText = _htmlLabelText;
			}
			
			icon.source = _iconSource;
		
		}
		
		protected function createLabel():StyleableTextField
		{
			var lbl:StyleableTextField = StyleableTextField(createInFontContext(StyleableTextField));
			lbl.editable = false;
			lbl.selectable = false;
			lbl.multiline = false;
			lbl.wordWrap = true;
			lbl.antiAliasType = AntiAliasType.ADVANCED;
			lbl.width = 200;
			lbl.height = 50;
			lbl.x = 40;
			lbl.y = this.height * 0.25;
			addElement(lbl);
			return lbl;
		}
		
		
		protected function createIcon():BitmapImage{
			
			var but:BitmapImage = new BitmapImage();
			but.width = 30;
			but.height = 30;
			but.y = this.height * 0.25;
			addElement(but);
			return but;
			
		}
		
		public function get labelText():String
		{
			return _labelText;
		}
		
		public function set labelText(value:String):void
		{
			_labelText = value;
		}
		
		public function get iconSource():String
		{
			return _iconSource;
		}
		
		public function set iconSource(value:String):void
		{
			
			_iconSource = value;
		}

		public function get htmlLabelText():String
		{
			return _htmlLabelText;
		}

		public function set htmlLabelText(value:String):void
		{
			_htmlLabelText = value;
			
		}
		
		public function getHTMLTextLength():int{
			
			return _htmlLabelText.length;
		}

	}
}