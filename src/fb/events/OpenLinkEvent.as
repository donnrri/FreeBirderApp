package fb.events
{
	import flash.events.Event;
	
	public class OpenLinkEvent extends Event
	{
		
		public static const OPEN_LINK:String = " open link";
		public static const OPEN_EMAIL:String = " open email";
		public static const OPEN_PHONE:String = " open phone";
		
		
		private var _path:String;
		
		
		public function OpenLinkEvent(type:String)
		{
			super(type);
		}
		
		public override function toString():String 
		{ 
			return formatToString("OpenLinkEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		override public function clone():Event
		{
			return new OpenLinkEvent( type );
		}
		

		public function get path():String
		{
			return _path;
		}

		public function set path(value:String):void
		{
			_path = value;
		}

	}
}