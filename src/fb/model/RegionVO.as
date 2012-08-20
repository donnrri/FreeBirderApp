package fb.model
{
	public class RegionVO
	{
		
		private var _country:String;
		private var _regions:Vector.<String>;
		private var _regionCodes:Vector.<String>;
		
		public function RegionVO()
		{
			_regions = new Vector.<String>();
			_regionCodes = new Vector.<String>();
			
		}

		public function get country():String
		{
			return _country;
		}

		public function set country(value:String):void
		{
			_country = value;
		}

		public function get regions():Vector.<String>
		{
			return _regions;
		}

		public function set regions(value:Vector.<String>):void
		{
			_regions = value;
		}

		public function get regionCodes():Vector.<String>
		{
			return _regionCodes;
		}

		public function set regionCodes(value:Vector.<String>):void
		{
			_regionCodes = value;
		}

       public function regionsToString():String{
		   
		   return regions.toString();
	   }
	}
}