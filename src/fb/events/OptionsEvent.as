package fb.events
{
	import fb.model.DayVO;
	
	import flash.events.Event;
	
	public class OptionsEvent extends Event
	{
		public static const ITEM_SELECTED:String = "item selected";
		public static const SELECTED_ITEM:String = "selected item";
		public static const DAY_INFORMATION:String = "day information";
		
		private var _item:String;
		private var _itemType:String;
		private var _title:String;
		private var _dayObject:DayVO;
		
		
		public function OptionsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public override function toString():String 
		{ 
			return formatToString("OptionsEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		override public function clone():Event
		{
			return new OptionsEvent( type );
		}
		
		
		public function get item():String
		{
			return _item;
		}

		public function set item(value:String):void
		{
			_item = value;
		}


		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}

		public function get itemType():String
		{
			return _itemType;
		}

		public function set itemType(value:String):void
		{
			_itemType = value;
		}

		public function get dayObject():DayVO
		{
			return _dayObject;
		}

		public function set dayObject(value:DayVO):void
		{
			_dayObject = value;
		}


	}
}