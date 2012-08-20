package fb.events
{
	import fb.model.AccomodationVO;
	import fb.model.FestivalVO;
	import fb.model.MailingListVO;
	import fb.model.MuseumVO;
	import fb.model.ObservatoryVO;
	import fb.model.ReserveVO;
	import fb.model.TourVO;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class ServiceEvent extends Event
	{
		
		public static const FESTIVALS:String = "festivals";
		public static const ACCOMODATION:String = "accomodation";
		public static const TRIPS:String = "trips";
		public static const VISIT:String = "visit";
		public static const MEET:String = "meet";
		public static const CATEGORIES_SUCCESS:String = "success";
		public static const CATEGORIES_COMPLETE:String = "complete";
		public static const LAST_RESULT:String = "last result";
		
		private var _hasFestivals:Boolean;
	
		private var _category:String;
		private var _accomodation:Vector.<AccomodationVO>;
		private var _reserves:Vector.<ReserveVO>;
		private var _observatories:Vector.<ObservatoryVO>;
		private var _museums:Vector.<MuseumVO>;
		private var _tours:Vector.<TourVO>;
		private var _mailing_list:Vector.<MailingListVO>;
        private var _festivals:Vector.<FestivalVO>;
		
		private var _reserveData:ArrayCollection;
		private var _accomodationData:ArrayCollection;
		private var _observatoriesData:ArrayCollection;
		private var _museumData:ArrayCollection;
		private var _mailingData:ArrayCollection;
		private var _festivalData:ArrayCollection;
		private var _tourData:ArrayCollection;
		
		
		public function ServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		
		override public function clone():Event
		{
			return new ServiceEvent(type);
		}
		
		
		public function get hasFestivals():Boolean
		{
			return _hasFestivals;
		}

		public function set hasFestivals(value:Boolean):void
		{
			_hasFestivals = value;
		}

		

		public function get accomodation():Vector.<AccomodationVO>
		{
			
			if(_accomodation.length < 1){
				
				_accomodation = new Vector.<AccomodationVO>();
			}
			return _accomodation;
		}

		public function set accomodation(value:Vector.<AccomodationVO>):void
		{
			_accomodation = new Vector.<AccomodationVO>();
			_accomodation = value;
		}

		public function get tours():Vector.<TourVO>
		{
			if(_tours.length < 1){
				
				_tours = new Vector.<TourVO>();
			}
			return _tours;
		}

		public function set tours(value:Vector.<TourVO>):void
		{
			_tours = new Vector.<TourVO>();
			_tours = value;
		}

		public function get category():String
		{
			return _category;
		}

		public function set category(value:String):void
		{
			_category = value;
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

		public function get museums():Vector.<MuseumVO>
		{
			return _museums;
		}

		public function set museums(value:Vector.<MuseumVO>):void
		{
			_museums = value;
		}

		public function get mailing_list():Vector.<MailingListVO>
		{
			return _mailing_list;
		}

		public function set mailing_list(value:Vector.<MailingListVO>):void
		{
			_mailing_list = value;
		}

		public function get festivals():Vector.<FestivalVO>
		{
			return _festivals;
		}

		public function set festivals(value:Vector.<FestivalVO>):void
		{
			_festivals = value;
		}

		public function get reserveData():ArrayCollection
		{
			return _reserveData;
		}

		public function set reserveData(value:ArrayCollection):void
		{
			_reserveData = value;
		}

		public function get accomodationData():ArrayCollection
		{
			return _accomodationData;
		}

		public function set accomodationData(value:ArrayCollection):void
		{
			_accomodationData = value;
		}

		public function get observatoriesData():ArrayCollection
		{
			return _observatoriesData;
		}

		public function set observatoriesData(value:ArrayCollection):void
		{
			_observatoriesData = value;
		}

		public function get museumData():ArrayCollection
		{
			return _museumData;
		}

		public function set museumData(value:ArrayCollection):void
		{
			_museumData = value;
		}

		public function get mailingData():ArrayCollection
		{
			return _mailingData;
		}

		public function set mailingData(value:ArrayCollection):void
		{
			_mailingData = value;
		}

		public function get festivalData():ArrayCollection
		{
			return _festivalData;
		}

		public function set festivalData(value:ArrayCollection):void
		{
			_festivalData = value;
		}

		public function get tourData():ArrayCollection
		{
			return _tourData;
		}

		public function set tourData(value:ArrayCollection):void
		{
			_tourData = value;
		}


	}
}