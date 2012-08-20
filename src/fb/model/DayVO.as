package fb.model
{
	import fb.components.renders.FestivalListItemRenderer;
	import fb.components.renders.TourListItemRenderer;

/*
	
	The DayVO class holds the daya for ech day in the calendar 
	Vectors are used for storing most trip items.
	*/
	public class DayVO
	{
		
		private static const ACCOMODATION:String = "[object AccomodationVO]";
		private static const TOURS:String = "[object ToursVO]";
		private static const RESERVES:String = "[object ReserveVO]";
		private static const OBSERVATORIES:String = "[object ObservatoryVO]";
		private static const MAILING_LIST:String = "[object MailingListVO]";
		private static const MUSEUMS:String = "[object MuseumVO]";
		private static const FESTIVAL:String = "[object FestivalVO]";
		
		private var _day:int;
		private var _month:String;
		private var _reserves:Vector.<ReserveVO>;
		private var _observatories:Vector.<ObservatoryVO>;
		private var _accomodation:String;
		private var _tours:Vector.<TourVO>;
		private var _mailingList:Vector.<MailingListVO>;
		private var _festivals:Vector.<FestivalVO>;
		private var _museums:Vector.<MuseumVO>;
		
		
		
		
		public function DayVO()
		{
			makeVectors();
		}
		
		private function makeVectors():void{
			
			_reserves = new Vector.<ReserveVO>();
			_observatories = new Vector.<ObservatoryVO>();
			_tours = new Vector.<TourVO>();
			_mailingList = new Vector.<MailingListVO>();
			_festivals = new Vector.<FestivalVO>();
			_museums = new Vector.<MuseumVO>();
		}

		public function get day():int
		{
			return _day;
		}

		public function set day(value:int):void
		{
			_day = value;
		}

		public function get month():String
		{
			return _month;
		}

		public function set month(value:String):void
		{
			_month = value;
		}

		public function get reserves():Vector.<ReserveVO>
		{
			return _reserves;
		}

		public function set reserves(value:Vector.<ReserveVO>):void
		{
			_reserves = value;
		}

		public function get observatories():Vector.<ObservatoryVO>
		{
			return _observatories;
		}

		public function set observatories(value:Vector.<ObservatoryVO>):void
		{
			_observatories = value;
		}

		public function get tours():Vector.<TourVO>
		{
			return _tours;
		}

		public function set tours(value:Vector.<TourVO>):void
		{
			_tours = value;
		}

		public function get mailingList():Vector.<MailingListVO>
		{
			return _mailingList;
		}

		public function set mailingList(value:Vector.<MailingListVO>):void
		{
			_mailingList = value;
		}

		public function get festivals():Vector.<FestivalVO>
		{
			return _festivals;
		}

		public function set festivals(value:Vector.<FestivalVO>):void
		{
			_festivals = value;
		}

		public function get museums():Vector.<MuseumVO>
		{
			return _museums;
		}

		public function set museums(value:Vector.<MuseumVO>):void
		{
			_museums = value;
		}

		public function setDayData(type:String, item:String):void{
			
		
			
			//trace(type + "  type and item  " + item);
			switch(type){
				
				case TOURS:
					
					if(_tours.length < 1){
						
				
					var to:TourVO = new TourVO();
					to.title = item;
					_tours.push(to);
				
					}
					
					break;
				
				case ACCOMODATION:
					
					_accomodation = item; 
					
					
					break;
				
				case OBSERVATORIES:
					
					if(_observatories.length < 1){
						
					
					var ob:ObservatoryVO = new ObservatoryVO();
					ob.title = item;
					_observatories.push(ob);
				
					
					}
					break;
				
				case RESERVES:
					
					if(_reserves.length < 1){
						
						var ro:ReserveVO = new ReserveVO();
						ro.title = item;
						_reserves.push(ro); 
					
					
					}
					break;
				
				case MUSEUMS:
					
					if(_museums.length < 1){
						
					
					var mo:MuseumVO = new MuseumVO();
					mo.title = item;
					_museums.push(mo);
				
					}
					break;
				
				case MAILING_LIST:
					
				
						//pic =  "assets/dpi160/icons/handshake_small.png";
					
					
					break;
				
				case FESTIVAL:
					
					if(_festivals.length < 1){
						
					var fo:FestivalVO = new FestivalVO();
					fo.title = item;
					_festivals.push(fo);
				
					}
					break;
				
				
				
			}
				
				
		}

		public function get accomodation():String
		{
			return _accomodation;
		}

		public function set accomodation(value:String):void
		{
			_accomodation = value;
		}


	}
}