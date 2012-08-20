package fb.interfaces
{
	import mx.collections.ArrayCollection;

	public interface IContinent
	{
		function getContinent():ArrayCollection;
		function getCountry(continent:String):ArrayCollection;
		function getRegions(country:String):ArrayCollection;
		function setCountries(countries:ArrayCollection):void;
		function setRegions(regions:ArrayCollection):void;
		function setContinent(continents:ArrayCollection):void;
	}
}