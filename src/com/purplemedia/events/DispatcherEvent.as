package com.purplemedia.events
{
	import flash.events.Event;
	
	public final class DispatcherEvent extends Event
	{
		public static const APPLICATION_READY:String = "applicationReady";
		
		public static const APPLICATION_ADDED:String = "applicationAdded";
		
		public function DispatcherEvent( type:String )
		{
			super( type, true, true );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new DispatcherEvent( type );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function toString():String
		{
			return formatToString( "DispatcherEvent", "type" );
		}
	}
}