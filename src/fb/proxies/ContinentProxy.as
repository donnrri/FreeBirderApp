package fb.proxies
{
	import fb.interfaces.IContinent;
	import fb.model.Continent;
	import fb.model.ContinentVO;
	import fb.model.ContinentsXML;
	import fb.model.CountryVO;
	
	import mx.collections.ArrayCollection;
	
	public class ContinentProxy implements IContinent
	{
		
		private var continent:Continent;
		
		
		public function ContinentProxy()
		{
			continent = new Continent();
		}
		
		public function getContinent():ArrayCollection
		{
			var dataset:ArrayCollection = new ArrayCollection();
			dataset = continent.getContinent();
			
			if(dataset.length < 1){
				
				continent.setContinent(dataset);
				dataset = continent.getContinent();
				}
		
		    return dataset;
		}
		
		public function getCountry(continentStr:String):ArrayCollection
		{ 
			var dataset:ArrayCollection = new ArrayCollection();
			dataset = continent.getCountry(continentStr);
			
			 return dataset;
		}
		
		public function getRegions(country:String):ArrayCollection
		{
			return null;
		}
		
		public function setCountries(countries:ArrayCollection):void
		{
		}
		
		public function setRegions(regions:ArrayCollection):void
		{
		}
		
		public function setContinent(continents:ArrayCollection):void
		{
		}
		
		
	
	}
}