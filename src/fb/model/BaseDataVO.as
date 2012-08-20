package fb.model
{
	public class BaseDataVO implements IDataModel
	{
		
		private var _id:String;
		private var _country:String;
		private var _continent:String;
		private var _type:String;
		
		public function BaseDataVO()
		{
		}

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}

		public function get country():String
		{
			return _country;
		}

		public function set country(value:String):void
		{
			_country = value;
		}

		public function get continent():String
		{
			return _continent;
		}

		public function set continent(value:String):void
		{
			_continent = value;
		}

		public function set type(value:String):void
		{
			
			_type = value;
		}
		
		public function get type():String
		{
			
			return _type;
		}
	}
}