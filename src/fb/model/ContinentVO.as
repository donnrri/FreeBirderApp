package fb.model
{
	public class ContinentVO
	{
		
		private var _name:String;
		private var _icon:String;
		
		
		public function ContinentVO()
		{
		}

		public function get icon():String
		{
			return _icon;
		}

		public function set icon(value:String):void
		{
			_icon = value;
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