package fb.events
{
	
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.core.FlexGlobals;
	import mx.events.FlexEvent;
	
	
	
	public final class Dispatcher
	{
		
		
		//--------------------------------------------------------------------------
		//
		//  Static
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected static var initialized:Boolean = false;
		
		/**
		 * @private
		 */
		protected static var _d:EventDispatcher;
		
		/**
		 *
		 */
		protected static function get d():EventDispatcher
		{
			/*
			if( !initialized )
				initialize();
			*/
			
			if( _d == null )
				_d = new EventDispatcher;
			return _d;
		}
		
		/**
		 * @copy		flash.events.IEventDispatcher#addEventDispatcher
		 */
		public static function addEventListener( type:String, handler:Function, useCapture:Boolean = false,
												 priority:int = 0, useWeakReference:Boolean = false ):void
		{
			d.addEventListener( type, handler, useCapture, priority, useWeakReference );
		}
		
		/**
		 * @copy		flash.events.IEventDispatcher#removeEventListener
		 */
		public static function removeEventListener( type:String, handler:Function, useCapture:Boolean = false ):void
		{
			d.removeEventListener( type, handler, useCapture );
		}
		
		/**
		 * @copy		flash.events.IEventDispatcher#dispatchEvent
		 */
		public static function dispatchEvent( event:Event ):Boolean
		{
			
			return d.dispatchEvent( event );
		}
		
		/**
		 * 
		 */
		public static function dispatch( event:Object ):Boolean
		{	
			if( event is String )
				event = new Event( event as String );
			
			return d.dispatchEvent( event as Event );
		}
		
		protected static function initialize():void
		{
			//trace( "initialize" );
			var app:Object = FlexGlobals.topLevelApplication;
			
			if( app.stage == null )
				app.addEventListener( Event.ADDED_TO_STAGE, pass );
			else
				dispatchEvent( new Event( Event.ADDED_TO_STAGE ) );
			
			if( !app.initialized )
				app.addEventListener( FlexEvent.CREATION_COMPLETE, pass );
			else
				dispatchEvent( new FlexEvent( FlexEvent.CREATION_COMPLETE ) );
			
			initialized = true;
		}
		
		protected static function pass( event:Event ):void
		{
			
			
			dispatchEvent( event );
		}
		
	}
}