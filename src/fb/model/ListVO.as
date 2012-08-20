package fb.model
{
	import mx.collections.ArrayCollection;

	public class ListVO
	{
		
		private var _name:String;
		private var _path:String;
		private var _data:ArrayCollection = new ArrayCollection();
		
		
		
		public function ListVO()
		{
			
			
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get path():String
		{
			return _path;
		}

		public function set path(value:String):void
		{
			_path = value;
		}

		public function get data():ArrayCollection
		{
			return _data;
		}

		public function set data(value:ArrayCollection):void
		{
			_data = value;
		}


	}
}