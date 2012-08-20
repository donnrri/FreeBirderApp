package fb.events
{
	import flash.events.Event;
	
	public class CustomEvent extends Event
	{
		
		public static const PLAN:String = " plan";
		
		
		public function CustomEvent(type:String)
		{
			super(type);
		}
		
		public override function toString():String 
		{ 
			return formatToString("customEvent"); 
		}
		
		override public function clone():Event
		{
			return new CustomEvent( type );
		}
	}
}