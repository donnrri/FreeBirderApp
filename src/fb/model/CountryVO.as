package fb.model
{
	public class CountryVO
	{
		
		private var _name:String;
		private var _icon:String;
		private var _regions:RegionVO;
		
		public function CountryVO()
		{
			_regions = new RegionVO();
			
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

		public function get regions():RegionVO
		{
			return _regions;
		}

		public function set regions(value:RegionVO):void
		{
			_regions = value;
		}



	}
}