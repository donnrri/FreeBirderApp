package fb.model
{
	import fb.interfaces.IContinent;
	
	import mx.collections.ArrayCollection;
	
	public class Continent implements IContinent
	{
		
		private var continents:ArrayCollection;
	
		private var countries:ArrayCollection;
		private var regions:ArrayCollection;
       
		private var continentXML:ContinentsXML;
		private var regionList:Regions;
		private var data:XML;
		private var regionData:XML;
		private var hasData:Boolean;
		private var _currentContinent:String;
		private var _currentCountry:String;
		
		
		
		public function Continent()
		{
			
			continents = new ArrayCollection();
			countries = new ArrayCollection();
			regions = new ArrayCollection();
			currentContinent = "";
			
			makeXML();
		}
		
		private function makeXML():void{
			
			continentXML  = new ContinentsXML();
			data = continentXML.getContinents();
			
			regionList = new Regions();
		}

		public function getContinent():ArrayCollection
		{
			
			return continents;
			
		}
		
		public function getCountry(continentStr:String):ArrayCollection
		{
			
			if(currentContinent == continentStr){
				
				return countries;
			}
			
			else{
				
				countries = makeCountries(continentStr);
			    currentContinent = continentStr;
			}
				
				return countries;
			
		}
		
		public function getRegions(country:String):ArrayCollection
		{
			if(currentCountry == country){
				
				return regions
			}
			
			else{
				
				regions = makeRegions(country);
			}
			
			return regions;
		}
		
		public function setCountries(_countries:ArrayCollection):void
		{
			
			this.countries = _countries;
		}
		
		public function setRegions(_regions:ArrayCollection):void
		{
			this.regions = regions;
		}
		
		public function setContinent(_continents:ArrayCollection):void
		{
			
			if(!containsData(continents)){
				
				for each( var item:XML in data.continent){
					
					var cObj:ContinentVO = new ContinentVO();
					cObj.name = item.name;
					cObj.icon = item.name.@icon;
					
					continents.addItem(cObj);
				}
			}
		}
		
		private function containsData(data:ArrayCollection):Boolean{
			
			hasData = false;
			if(data.length > 0){
				
				hasData = true;
			}
			
			return hasData;
		}


		
		private function makeCountries(str:String):ArrayCollection{
			
			countries.removeAll();
			
			for each( var item:XML in data.continent){
				
				if(str == item.name){
					
					for each (var countryItem:XML in item.countryList.country){
						
						var cObj:CountryVO = new CountryVO();
						cObj.name = countryItem;
						cObj.icon = countryItem.@icon;
						
						
						if(regionList.hasRegion(cObj.name)){
							
							cObj.regions = regionList.getRegions(countryItem);
				
						}
						
						countries.addItem(cObj);
					}
					
					break;
				}
			}
			
			
			
			return countries;
		}
		
		
		private function hasRegions(countryStr:String):Boolean{
			
			return regionList.hasRegion(countryStr);
		}
		private function makeRegions(str:String):ArrayCollection{
			
			return regions;
		}
		
		
		public function get currentContinent():String
		{
			return _currentContinent;
		}
		
		public function set currentContinent(value:String):void
		{
			_currentContinent = value;
		}

		public function get currentCountry():String
		{
			return _currentCountry;
		}

		public function set currentCountry(value:String):void
		{
			_currentCountry = value;
		}

	}
}