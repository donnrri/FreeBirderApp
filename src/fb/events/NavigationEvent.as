package fb.events
{
	import flash.events.Event;
	
	public class NavigationEvent extends Event
	{
		public static const CHANGE_VIEW:String= "change view";
		public static const FADE_CALENDAR:String = "fade calendar";
		
		private var _view:String;
		
		
		public function NavigationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		override public function clone():Event
		{
			return new NavigationEvent(type);
		}

		public function get view():String
		{
			return _view;
		}

		public function set view(value:String):void
		{
			_view = value;
		}

	}
}