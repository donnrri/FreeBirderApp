package fb.events
{
	import flash.events.Event;
	
	public class FBErrorEvent extends Event
	{
		
		public static const INCORRECT_TRIP_DATE:String = "Incorrect trip date";
		public static const INCORRECT_YEAR:String = "Incorrect year range";
	
		
		
		public function FBErrorEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new FBErrorEvent(type);
		}

	

	}
}