package fb.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class GroupDataEvent extends Event
	{
		
		public static const CLOSE_DATA:String = "close data";
		public static const OPEN_DATA:String = "open data";
		public static const LIST_DATA:String = "list data";
		
		private var _position:uint;
		private var _listData:ArrayCollection;
		
		public function GroupDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new GroupDataEvent(type);
		}

		public function get position():uint
		{
			return _position;
		}

		public function set position(value:uint):void
		{
			_position = value;
		}

		public function get listData():ArrayCollection
		{
			return _listData;
		}

		public function set listData(value:ArrayCollection):void
		{
			_listData = new ArrayCollection();
			_listData = value;
		}


	}
}