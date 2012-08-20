package fb.events
{
	
	import flash.events.Event;

	public class CalendarEvent extends Event 
	{
		public static const CHANGE:String = "change";
		public static const LOADED:String = "loaded";
		public static const DATE_CHANGE:String = "DATE CHANGE";
		public static const ADD_ITEM:String = "add item"
		
		private var date:String;
		private var _index:int;
		
		public function get selectedDate():String { return date;}
		
		public function CalendarEvent(type:String,data:*=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			date = data;
		} 
		
		
		
		public override function toString():String 
		{ 
			return formatToString("calendarEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		override public function clone():Event
		{
			return new CalendarEvent( type );
		}

		public function get index():int
		{
			return _index;
		}

		public function set index(value:int):void
		{
			_index = value;
		}

		
	}
}