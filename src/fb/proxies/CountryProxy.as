package fb.proxies
{
	import fb.interfaces.ICountry;
	import fb.model.CountriesXML;
	import fb.model.Country;
	
	import mx.collections.ArrayCollection;

	
	
	
	public class CountryProxy implements ICountry
	{
		
		
		private var countryXML:CountriesXML;
		private var data:XML;
		private var country:Country;
		private var hasData:Boolean;
		
		public function CountryProxy()
		{
			
			countryXML  = new CountriesXML();
			data = countryXML.getXML();
			country = new Country();
		}
		
		public function getLetters():Array
		{
			
			var letters:Array = new Array();
			letters = country.getLetters();
			var len:int = letters.length;
			
			if(len < 1){
				
				/* 
				make arry from XML and passs to country.setLetters
				
				go through the xmlList and pull out the letters
				*/
				
				for each( var item:XML in data.countryList){
					
					var str:String = item.firstLetter;
					letters.push(str);
				}
				
			}
			country.setLetters(letters);
			return letters;
		}
		
		public function getCountry(letter:String):ArrayCollection
		{
			
			var countryCollection:ArrayCollection = new ArrayCollection();
			countryCollection = country.getCountry(letter);
			//trace(containsData(countryCollection));
			
			if(!containsData(countryCollection)){
				
				for each( var item:XML in data.countryList){
					
					var str:String = item.firstLetter;
					
					if (str == letter){
						
						for each (var countryItem:XML in item.country){
							
							countryCollection.addItem(countryItem.toString());
						}
					}
					
				}
			}
			country.setCountries(countryCollection);
			
			return countryCollection;
		}
		
		public function getRegions(countryStr:String):ArrayCollection
		{
			var regionCollection:ArrayCollection = new ArrayCollection();
			regionCollection = country.getRegions(countryStr);
		
			if(!containsData(regionCollection)){
				
				for each( var item:XML in data.countryList.country.regionList){
					
					var str:String = item.@country;
					
					if(str == countryStr){
						for each (var region:XML in item.region){
							
							regionCollection.addItem(region.toString());
						}
					}
				}
				
			}
			
		    country.setRegions(regionCollection);
			return regionCollection;
		}
		
		public function setCountries(countries:ArrayCollection):void
		{
			
			
			
		}
		
		public function setRegions(regions:ArrayCollection):void
		{
			
		}
		
		public function setLetters(letters:Array):void
		{
			
		}
		
		private function containsData(collection:ArrayCollection):Boolean{
			
			hasData = false;
			if(collection.length > 0){
				
				hasData = true;
			}
			
			return hasData;
		}
	}
}