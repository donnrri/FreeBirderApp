package fb.interfaces
{
	import mx.collections.ArrayCollection;

	public interface ICountry
	{
		function getLetters():Array;
		function getCountry(letter:String):ArrayCollection;
		function getRegions(country:String):ArrayCollection;
		function setCountries(countries:ArrayCollection):void;
		function setRegions(regions:ArrayCollection):void;
		function setLetters(letters:Array):void;
		
	}
}