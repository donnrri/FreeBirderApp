package fb.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class ItemSelectionEvent extends Event
	{
		public static const CONTINENT_SELECTED:String= "continent_selected";
		public static const COUNTRY_SELECTED:String= "country_selected";
		public static const REGION_SELECTED:String= "country_selected";
		public static const SELECT_COUNTRY:String = "select country";
		public static const TRIP_ITEM_SELECTED:String = "trip item selected";
	
		private var _itemStr:String;
		private var _itemType:String;
		private var _iconStr:String;
		
		private var _itemCollection:ArrayCollection;
		
		public function ItemSelectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		
		public function get itemCollection():ArrayCollection
		{
			return _itemCollection;
		}

		public function set itemCollection(value:ArrayCollection):void
		{
			_itemCollection = value;
		}

		override public function clone():Event
		{
			return new ItemSelectionEvent(type);
		}
		
		public function get itemStr():String
		{
			return _itemStr;
		}

		public function set itemStr(value:String):void
		{
			_itemStr = value;
		}

		public function get itemType():String
		{
			return _itemType;
		}

		public function set itemType(value:String):void
		{
			_itemType = value;
		}

		public function get iconStr():String
		{
			return _iconStr;
		}

		public function set iconStr(value:String):void
		{
			_iconStr = value;
		}


	}
}