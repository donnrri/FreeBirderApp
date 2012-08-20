package fb.model
{
	public class SelectedVO
	{
		/* the type specifies a region or a country*/
		private var _type:String;
		private var _name:String;
		
		public function SelectedVO()
		{
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}


	}
}