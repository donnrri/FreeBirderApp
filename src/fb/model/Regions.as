package fb.model
{
	import mx.collections.ArrayCollection;

	public class Regions
	{
		import fb.model.RegionXML;
		
		
		private var _countries:Vector.<String>;
	    private var _hasRegions:Boolean;
		private var regionXML:RegionXML;
		private var data:XML;
		
		
		public function Regions()
		{
			
			
			_countries = new Vector.<String>();
			
			regionXML = new RegionXML();
			data = regionXML.getData();
			
			hasRegions = false;
			
			getCountries();
		}

	
		


		public function getCountries():void
		{
			
			for each(var item:XML in data.regionList ){
				
				var country:String = item.@country;
			
				_countries[_countries.length] = country; // this method is slightly quicker than push
			}
			
			
		}

		public function setCountries(value:Vector.<String>):void
		{
			_countries = value;
		}

		public function hasRegion(country:String):Boolean
		{
			_hasRegions = false;
			
			if(_countries.length > 0){ // if there are any countries
				
				var length:uint = _countries.length;
				for ( var i:uint=0; i<length; i++ ) {// find if a match or return false
					if (_countries[ i ] == country) {
					
						_hasRegions = true;
						
					}
				}
			}
			
			
			return _hasRegions;
		}
		
		public function get hasRegions():Boolean
		{
			return _hasRegions; 
		}

		public function set hasRegions(value:Boolean):void
		{
			_hasRegions = value;
		}



		public function getRegions(countryStr:String):RegionVO {
			
			var region:RegionVO = new RegionVO();
			
			region.country = countryStr;
			var i:uint = 0;
			
			var list:XMLList = data.*;
			var countryList:XMLList = list.(@country == countryStr); // get xmllist of country regions
			//trace(":::::::::::::::::::  " + countryList);
			//trace(" ----------------------------------------------------  " );
			
		
			for each(var item:XML in countryList.region){
	
				region.regions[i] = item;
				region.regionCodes[i] = item.@abbv;
					i++;
					
			}
			
			return region;
		}


		


	}
}