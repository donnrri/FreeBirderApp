package fb.model
{
	public class RegionXML
	{
		
		var data:XML;
		
		
		public function RegionXML()
		{
			data = <regions>
	<regionList country="United States of America">		
	<region  abbv="AL" >	Alabama	</region>
	<region  abbv="AK" >	Alaska 	</region>
	<region  abbv="AZ" >	Arizona	</region>
	<region  abbv="AR" >	Arkansas	</region>
	<region  abbv="CA" >	California	</region>
	<region  abbv="CO" >	Colorado	</region>
	<region  abbv="CT" >	Connecticut	</region>
	<region  abbv="DE" >	Delaware	</region>
	<region  abbv="FL" >	Florida	</region>
	<region  abbv="GA" >	Georgia	</region>
	<region  abbv="HI" >	Hawaii	</region>
	<region  abbv="ID" >	Idaho	</region>
	<region  abbv="IL" >	Illinois	</region>
	<region  abbv="IN" >	Indiana	</region>
	<region  abbv="IA" >	Iowa	</region>
	<region  abbv="KS" >	Kansas	</region>
	<region  abbv="KY" >	Kentucky 	</region>
	<region  abbv="LA" >	Louisiana	</region>
	<region  abbv="ME" >	Maine 	</region>
	<region  abbv="MD" >	Maryland	</region>
	<region  abbv="MA" >	Massachusetts 	</region>
	<region  abbv="MI" >	Michigan	</region>
	<region  abbv="MN" >	Minnesota	</region>
	<region  abbv="MS" >	Mississippi 	</region>
	<region  abbv="MO" >	Missouri 	</region>
	<region  abbv="MT" >	Montana	</region>
	<region  abbv="NE" >	Nebraska	</region>
	<region  abbv="NV" >	Nevada	</region>
	<region  abbv="NH" >	New Hampshire	</region>
	<region  abbv="NJ" >	New Jersey	</region>
	<region  abbv="NM" >	New Mexico	</region>
	<region  abbv="NY" >	New York	</region>
	<region  abbv="NC" >	North Carolina	</region>
	<region  abbv="ND" >	North Dakota	</region>
	<region  abbv="OH" >	Ohio	</region>
	<region  abbv="OK" >	Oklahoma	</region>
	<region  abbv="OR" >	Oregon	</region>
	<region  abbv="PA" >	Pennsylvania 	</region>
	<region  abbv="RI" >	Rhode Island	</region>
	<region  abbv="SC" >	South Carolina	</region>
	<region  abbv="SD" >	South Dakota	</region>
	<region  abbv="TN" >	Tennessee	</region>
	<region  abbv="TX" >	Texas	</region>
	<region  abbv="UT" >	Utah	</region>
	<region  abbv="VT" >	Vermont	</region>
	<region  abbv="VA" >	Virginia	</region>
	<region  abbv="WA" >	 Washington	</region>
	<region  abbv="WV" >	West Virginia 	</region>
	<region  abbv="WI" >	Wisconsin	</region>
	<region  abbv="WY" >	Wyoming	</region>
	</regionList>
				<regionList country="Canada"> 
	<region abbv="" >	Alberta	</region>
	<region abbv="" >	British Columbia	</region>
	<region abbv="" >	Manitoba	</region>
	<region abbv="" >	New Brunswick	</region>
	<region abbv="" >	Newfoundland and Labrador	</region>
	<region abbv="" >	Northwest Territories	</region>
	<region abbv="" >	Nova Scotia	</region>
	<region abbv="" >	Nunavut	</region>
	<region abbv="" >	Ontario	</region>
	<region abbv="" >	Prince Edward Island	</region>
	<region abbv="" >	Quebec	</region>
	<region abbv="" >	Saskatchewan	</region>
	<region abbv="" >	Yukon	</region>
				</regionList>
				<regionList country="United Kingdom"> 
<region  abbv="" >	Bedfordshire	</region>
<region  abbv="" >	Berkshire	</region>
<region  abbv="" >	Buckinghamshire	</region>
<region  abbv="" >	Cambridgeshire	</region>
<region  abbv="" >	Cheshire	</region>
<region  abbv="" >	Cornwall	</region>
<region  abbv="" >	Cumberland	</region>
<region  abbv="" >	Derbyshire	</region>
<region  abbv="" >	Devon	</region>
<region  abbv="" >	Dorset	</region>
<region  abbv="" >	Durham	</region>
<region  abbv="" >	East Yorkshire	</region>
<region  abbv="" >	Essex	</region>
<region  abbv="" >	Gloucestershire	</region>
<region  abbv="" >	Hampshire	</region>
<region  abbv="" >	Herefordshire	</region>
<region  abbv="" >	Hertfordshire	</region>
<region  abbv="" >	Huntingdonshire	</region>
<region  abbv="" >	Kent	</region>
<region  abbv="" >	Lancashire	</region>
<region  abbv="" >	Leicestershire	</region>
<region  abbv="" >	Lincolnshire	</region>
<region  abbv="" >	Middlesex	</region>
<region  abbv="" >	Norfolk	</region>
<region  abbv="" >	North Yorkshire	</region>
<region  abbv="" >	Northamptonshire	</region>
<region  abbv="" >	Northumberland	</region>
<region  abbv="" >	Nottinghamshire	</region>
<region  abbv="" >	Oxfordshire	</region>
<region  abbv="" >	Rutland	</region>
<region  abbv="" >	Shropshire	</region>
<region  abbv="" >	Somerset	</region>
<region  abbv="" >	Staffordshire	</region>
<region  abbv="" >	Suffolk	</region>
<region  abbv="" >	Surrey	</region>
<region  abbv="" >	Sussex	</region>
<region  abbv="" >	Warwickshire	</region>
<region  abbv="" >	West Yorkshire	</region>
<region  abbv="" >	Westmorland	</region>
<region  abbv="" >	Wiltshire	</region>
<region  abbv="" >	Worcestershire	</region>

				</regionList>
	</regions>;
	}
	
	public function getData():XML{
	
	return data;
	}
	}
}