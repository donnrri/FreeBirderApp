package fb.components.renders
{
	import fb.events.Dispatcher;
	import fb.events.ItemSelectionEvent;
	import fb.model.ContinentVO;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.AntiAliasType;
	
	import mx.core.FlexGlobals;
	
	import spark.components.Image;
	import spark.components.supportClasses.ItemRenderer;

	import spark.components.Label;
	import spark.core.ContentCache;
	import spark.primitives.BitmapImage;
	
	
	public class LetterRenderer extends ItemRenderer
	{
		
		private static const ASSET_STR:String = "assets/dpi160/continents/";
		private static const IMG_WIDTH:int = 50;
		private static const IMG_HEIGHT:int = 50;
		private var cache:ContentCache = new ContentCache(); //http://corlan.org/2011/08/16/flex-mobile-development-caching-images-using-contentcache/
		protected var textLabel:Label;
		private var subtleDropShadow:DropShadowFilter = new DropShadowFilter(2,45,0,0.8, 2, 2);
		private var icon:Image;
		//private var graphic:BitmapImage;
		private var selectedItem:Boolean = false;
		
		
		public function LetterRenderer()
		{
			super();
			
			//Dispatcher.addEventListener(ItemSelectionEvent.CONTINENT_SELECTED, setAlpha);
			
		}
		
		
		override public function set data(value:Object):void
		{
			super.data = value;
			if (value == null){
				return;
			}
			
			var obj:ContinentVO = value as ContinentVO;
		trace(obj.name + "  ");
			if(obj.name){
				
				textLabel.text  = obj.name;
				icon.source = ASSET_STR + obj.icon;
				
			}
			
			//lblStation.commitStyles();				
		}
		/*
		Override this method to create schildren for the itemrenderer
		*/
		override protected function createChildren():void
		{
			if (!textLabel)
			{
				textLabel = createLabel();
				//clabel.styleDeclaration = styleManager.getStyleDeclaration(".stationText1");
				//textLabel.filters = [subtleDropShadow];
			}
			
			if(!icon){
				
				icon = createIcon();
			}
		}
	
		
		protected function createLabel():Label
		{
			var lbl:Label = Label(createInFontContext(Label));
		/*	lbl.editable = false;
			lbl.selectable = false;
			lbl.multiline = false;
			lbl.wordWrap = false;
			lbl.antiAliasType = AntiAliasType.ADVANCED;*/
			lbl.width = 100;
			lbl.height = 50;
			addElement(lbl);
			return lbl;
		}
		
		protected function createIcon():Image {
			
			var img:Image = new Image();
			img.width = IMG_WIDTH;
			img.height = IMG_HEIGHT;
			img.addEventListener(MouseEvent.CLICK, handleSelection);
			addElement(img);
			return img;

		}
		

		
		private function handleSelection(e:MouseEvent):void{
			
			selectedItem = true;
			

			var eve:ItemSelectionEvent = new ItemSelectionEvent(ItemSelectionEvent.CONTINENT_SELECTED);
			eve.itemStr = textLabel.text;
			eve.iconStr = String(icon.source);
			Dispatcher.dispatchEvent(eve);
			
			
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			//position the lable referencing the img added
			textLabel.y = IMG_HEIGHT/2;
			textLabel.x = IMG_WIDTH;
			
		}
		
		private function setAlpha(e:ItemSelectionEvent):void{
			
			if(selectedItem){
				
				this.alpha = 1;
			}
			
			else{
				
				this.alpha = 0;
			}
		}
		
	}
}