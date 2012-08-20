package fb.model
{
	import fb.interfaces.ICountry;
	
	import mx.collections.ArrayCollection;
	
	public class Country implements ICountry
	{
		
		private var letters:Array;
		private var countries:ArrayCollection;
		private var regions:ArrayCollection;
		private var _countryName:String;
		private var _icon:String;
	
		
		public function Country():void
		{
			
			letters = new Array();
			countries = new ArrayCollection();
			regions = new ArrayCollection();
		}
		
		public function get icon():String
		{
			return _icon;
		}

		public function set icon(value:String):void
		{
			_icon = value;
		}

		public function get countryName():String
		{
			return _countryName;
		}

		public function set countryName(value:String):void
		{
			_countryName = value;
		}

		public function getLetters():Array
		{
			return letters;
		}
		
		public function getCountry(letter:String):ArrayCollection
		{
			return countries;
		}
		
		public function getRegions(country:String):ArrayCollection
		{
			return regions;
		}
		
		public function setCountries(_countries:ArrayCollection):void
		{
			this.countries = _countries;
		}
		
		public function setRegions(_regions:ArrayCollection):void
		{
			this.regions = _regions;
		}
		
		public function setLetters(_letters:Array):void
		{
			this.letters = _letters;
		}
	}
}