package fb.components.renders
{
	import fb.events.Dispatcher;
	import fb.events.ItemSelectionEvent;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextLineMetrics;
	
	import mx.core.FlexGlobals;
	import mx.core.UITextFormat;
	import mx.styles.CSSStyleDeclaration;
	
	import spark.components.Image;
	import spark.components.LabelItemRenderer;
	import spark.components.supportClasses.StyleableTextField;
	import spark.core.ContentCache;
	import spark.primitives.BitmapImage;
	
	
	public class TripItemRenderer extends LabelItemRenderer
	{
	
		private static const IMG_WIDTH:int = 50;
		private static const IMG_HEIGHT:int = 50;
		private var cache:ContentCache = new ContentCache(); //http://corlan.org/2011/08/16/flex-mobile-development-caching-images-using-contentcache/
		protected var textLabel:StyleableTextField;
		private var subtleDropShadow:DropShadowFilter = new DropShadowFilter(2,45,0,0.8, 2, 2);
		private var icon:Image;
		private var selectedItem:Boolean = false;
		private var tWidth:Number;
		
		public function TripItemRenderer()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			if (value == null){
				return;
			}
			    textLabel.text  = value.label;
				icon.source = value.icon;
			
			}
		
		
		
		override protected function createChildren():void
		{
			if (!textLabel)
			{
				textLabel = createLabel();
				
			}
			
			if(!icon){
				
				icon = createIcon();
			}
		}
		
		override protected function drawBackground(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			
			
			super.drawBackground(unscaledWidth, unscaledHeight);
			// do any drawing for the background of the item renderer here
		//trace(unscaledWidth + "  and height = " + unscaledHeight);
			// Fixed a bug with Atrix on some render artifacts
		/*	this.graphics.clear();
            this.graphics.beginFill(0x334466);
			this.graphics.drawCircle(100, 100, 100);*/
			
		}
		
		
		protected function createLabel():StyleableTextField
		{
			var lbl:StyleableTextField = StyleableTextField(createInFontContext(StyleableTextField));
			lbl.editable = false;
			lbl.selectable = false;
			lbl.multiline = false;
			lbl.wordWrap = false;
			lbl.antiAliasType = AntiAliasType.ADVANCED;
			lbl.width = 100;
			lbl.height = 50;
			addChild(lbl);
			return lbl;
		}
		
		protected function createIcon():Image {
			
			var img:Image = new Image();
			img.width = IMG_WIDTH;
			img.height = IMG_HEIGHT;
			img.addEventListener(MouseEvent.CLICK, handleSelection);
			addChild(img);
			return img;
			
		}
		
		private function handleSelection(e:MouseEvent):void{
			
			selectedItem = true;
			
			var continent:String = textLabel.text;
			var eve:ItemSelectionEvent = new ItemSelectionEvent(ItemSelectionEvent.TRIP_ITEM_SELECTED);
			eve.itemStr = textLabel.text; 
			Dispatcher.dispatchEvent(eve);
			
			
		}
		
		override protected function layoutContents(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			//position the lable referencing the img added
			textLabel.y = IMG_HEIGHT + 10;
			textLabel.width = textLabel.textWidth + 2;
			
			textLabel.x = (IMG_WIDTH - textLabel.width)/2;
			
			//trace(unscaledWidth + "  and height in upadteDisplaylist= " + unscaledHeight);
		}
			
	
	}
}