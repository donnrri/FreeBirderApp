package fb.components.date
{
	import flash.display.Sprite;
	import spark.core.SpriteVisualElement;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.events.Event;
	/**
	 * ...
	 * @author Nidin Vinayak
	 */
	public class DateField extends SpriteVisualElement
	{
		
		
		/* STYLE ELEMENTS */
		private var _fieldColor:int = 0xFFFFFF;
		private var _topBoarderColor:int = 0x6D6F70;
		private var _rightBoarderColor:int = 0xC9CBCC;
		private var _bottomBoarderColor:int = 0xD3D5D6;
		private var _leftBoarderColor:int = 0xC9CBCC;
		
		private var _t:TextField;
		private var _font:String 	= "Tahoma";
		private var _fontSize:int = 20;
		private var _color:int 	= 0x000000;
		private var _bold:Boolean = false;
		private var _align:String = "left";
		private var _format:TextFormat;
		
		/* FILED DIMENSIONS */		
		private var fieldWidth:int = 200;
		private var fieldHeight:int = 40;
		
		public function get text():String { return _t.text;}
		public function set text(tx:String):void { _t.text = tx; }		
		
		public function set fieldColor(color:int):void { _fieldColor = color;}
		public function set topBoarderColor(color:int):void { _topBoarderColor = color; }
		public function set rightBoarderColor(color:int):void { _rightBoarderColor = color; }
		public function set bottomBoarderColor(color:int):void { _bottomBoarderColor = color; }
		public function set leftBoarderColor(color:int):void { _leftBoarderColor = color; }
		
		public function set format(f:TextFormat):void { _t.defaultTextFormat = f; }
		public function set font(f:String):void { _font = f; }
		public function set fontSize(f:int):void { _fontSize = f; }
		public function set color(f:int):void { _color = f; }
		public function set bold(f:Boolean):void { _bold = f; }
		public function set align(f:String):void { _align = f; }
		
		public function DateField(){
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			configUI();
		}
		protected function configUI():void {
			_t = new TextField();			
			_t.wordWrap 	= false;
			_t.autoSize = TextFieldAutoSize.LEFT;
			_t.multiline = false;
			//addChild(_t);
			_t.width = fieldWidth - 2;
			_t.height = fieldHeight - 2;
			_t.x = 1;
			_t.y = 1;
			if(_format == null){
				_format 		= new TextFormat();
				_format.font 	= _font;
				_format.size 	= _fontSize;
				_format.color	= _color;
				_format.bold	= _bold;
				_format.align	= _align;
				_t.defaultTextFormat = _format;
			}
			_t.text 		= "Select Date";
			//var grid:Rectangle = new Rectangle(1, 1, fieldWidth - 2, fieldHeight - 2);
			//this.scale9Grid = grid;

			_t.visible = true;
			drawField();
		}
		protected function drawField():void {
			this.graphics.beginFill(_fieldColor);
			this.graphics.drawRect(0, 0, fieldWidth,fieldHeight);
			this.graphics.endFill();
			this.graphics.lineStyle(1, _topBoarderColor, 1);
			this.graphics.moveTo(0, 0);
			this.graphics.lineTo(fieldWidth, 0);
			this.graphics.lineStyle(1, _rightBoarderColor, 1);
			this.graphics.lineTo(fieldWidth, fieldHeight);
			this.graphics.lineStyle(1, _bottomBoarderColor, 1);
			this.graphics.lineTo(0, fieldHeight);
			this.graphics.lineStyle(1, _leftBoarderColor, 1);
			this.graphics.lineTo(0, 1);
		}
		
		
		
	}

}