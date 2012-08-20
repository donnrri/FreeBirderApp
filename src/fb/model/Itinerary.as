package fb.model
{
	
	import fb.events.Dispatcher;
	import fb.events.GroupDataEvent;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	
	import org.casa.lib.utils.DateUtil;

	public class Itinerary
	{
		
		private static var _instance:Itinerary;
		
		private var _country:String;
		private var _startDateStr:String;
		private var _startDate:Date;
		private var _endDateStr:String;
		private var _endDate:Date;
		private var _numberOfDays:int;
		
		private var isOverMonth:Boolean = false;
		
		private var startMonthFirstDay:int;
		private var startMonthLastDay:int;
		private var endMonthFirstDay:int;
		private var endMonthLastDay:int;
		private var startMonth:Number;
		private var endMonth:Number;
		private var currentYear:Number;
		private var days:ArrayCollection;
		private var _rendererDictionary:Dictionary;
		
		private var _destination:DestinationVO;
		
		public function Itinerary(IteineraryEnforcer:ItineraryEnforcer)
		{

         rendererDictionary = new Dictionary();
			
		}
		
		public static function getInstance():Itinerary{
			
			if(_instance == null){
				
				_instance = new Itinerary(new ItineraryEnforcer);
			}
			
			return _instance;
		}

		public function get country():String
		{
			return _country;
		}

		public function set country(value:String):void
		{
			_country = value;
		}

		public function get startDateStr():String
		{
			return _startDateStr;
		}

		public function set startDateStr(value:String):void
		{
			_startDateStr = value;
		}

		public function get startDate():Date
		{
			return _startDate;
		}

		public function set startDate(value:Date):void
		{
			_startDate = value; 
		}

		public function get endDateStr():String
		{
			return _endDateStr;
		}

		public function set endDateStr(value:String):void
		{
			_endDateStr = value;
		
		}

		public function get endDate():Date
		{
			return _endDate;
		}

		public function set endDate(value:Date):void
		{
			_endDate = value;
			
			if(_startDateStr != null){
				
				numberOfDays = setNumberOfDays(_startDate , _endDate);
				isOverMonth = overMonth();
				currentYear = startDate.fullYear;
			    setDays();
			}
		}

		public function get numberOfDays():int
		{
			return _numberOfDays;
		}

		public function set numberOfDays(value:int):void
		{
			_numberOfDays = value;
		}

		private function setNumberOfDays(start:Date, end:Date):Number{
			
			var value:Number = DateUtil.getTimeBetween(start, end);
			var days:int = ((((value / 1000)/60)/60)/24); // convert milliseconds to days
			numberOfDays = Math.floor(days);
			
			return numberOfDays
		}

        private function overMonth():Boolean{
			
			
			    startMonth = getMonthNumber(startDate);
				endMonth = getMonthNumber(endDate); 
				
				if(startMonth != endMonth){
				isOverMonth = true;
				}
			
			return isOverMonth;
		}
	
		
		private function getMonthNumber(d:Date):Number{
			
			return d.month;
		}
	
	private function setDays():ArrayCollection{
		
		days = new ArrayCollection;
		
			var start:Number = getDay(_startDate); //.date;
			var end:Number = getDay(_endDate); //.date;  trace("start = " + start + " and end = " + end);
			days = makeDays(start, end, days);
			
		return days;
		}
	
	
	private function getDay(d:Date):Number{
		
		return d.date;
	}
	private function makeDays(start:Number, end:Number, days:ArrayCollection):ArrayCollection{
		
		var month:String = getMonth(startMonth);
		
		if(!isOverMonth){
		
			var limit:Number= (end - start) + 1; 
			
			for(var i:int = 0; i < limit; ++i){
				
				var dayObj:DayVO = new DayVO();
				dayObj.month = month;
				dayObj.day = start + i;  
				days.addItem(dayObj);
			}
			 sendDone(days);
		}
		
		else{
			//get the days in the current month
			var endDay:Number = DateUtil.getDaysInMonth(currentYear, startMonth);
		    var firstMonthDays:Number = endDay - start;
			
			
			days = makeFirstMonthCollection(firstMonthDays, month, days);
			// see what end month is 
			
			var months:Number = endMonth - startMonth;
			
			days = makeRemainingMonthsCollection(months, month, days);
			}
			//var overMonth:Boolean = overLimit(currentYear, )
		
		
		return days;
		}
	
	
		private function getMonth(value:Number):String{
		
		var returnStr:String = DateUtil.getMonthAsString(value);
			
		return returnStr;
		}
		
		private function overLimit(month:Number, days:Number):Boolean{
			
			var returnBol:Boolean = false;
			
			var limit:Number = DateUtil.getDaysInMonth(currentYear, month);
			
			if(limit < days){
				
				returnBol = true;
			}
		
			return returnBol;
		}
	
	
	private function  makeFirstMonthCollection(value:Number, month:String, days:ArrayCollection):ArrayCollection{
		
		var limit:int = value+1;
	
		for(var i:int = 0; i < limit; ++i){
			
			var dayObj:DayVO = new DayVO();
			dayObj.month = month;
			dayObj.day = value + i;  
			days.addItem(dayObj);
		}
		
		return days;
	}
	
	
	private function makeRemainingMonthsCollection(months:Number, month:String, days:ArrayCollection):ArrayCollection{
		
		var limit:Number;
		var nextMonth:String  = getNextMonth(month);
	
		if(months == 1){
			
			var day:Number  = getDay(_endDate);  //trace("day in next month =  " + day);
			
			limit = day + 1;
			for(var i:int = 0; i < limit; ++i){
				
				var dayObj:DayVO = new DayVO();
				dayObj.month = nextMonth;
				dayObj.day = 1 + i;  
				days.addItem(dayObj);
			}
			
			sendDone(days);
		}
		
		else{
			
		
			while(months != 1){
				
				var monthValue:Number  = DateUtil.getFullMonthNameNumber(nextMonth);
				limit = DateUtil.getDaysInMonth(currentYear, monthValue );
				
				for(var i:int = 0; i < limit; ++i){
					
					var dayObj:DayVO = new DayVO();
					dayObj.month = nextMonth;
					dayObj.day = 1 + i;  
					days.addItem(dayObj);
				}
				
				
				months--;
			}
			
			if(months == 1){
				
				var day:Number  = getDay(_endDate);  //trace("day in next month =  " + day);
				nextMonth  = getNextMonth(nextMonth);
				limit = day + 1;
				for(var i:int = 0; i < limit; ++i){
					
					var dayObj:DayVO = new DayVO();
					dayObj.month = nextMonth;
					dayObj.day = 1 + i;  
					days.addItem(dayObj);
				}
			}
			
			sendDone(days);
		}
		//trace(days.length + "   --> days length in over month");
		return days;
	}
	
	private function getNextMonth(month:String):String{
		
		var currentMonthNumber:Number = DateUtil.getFullMonthNameNumber(month);
	    var nextMonth:String = DateUtil.getMonthAsString(currentMonthNumber);
		// Note becuase I get a 1 - 12 value for the month I do not need to add one as the array used for the actual months 
		// has a zero as its first index.
		
		return nextMonth;
	}
	
	private function sendDone(value:ArrayCollection):void{
		
		var eve:GroupDataEvent = new GroupDataEvent(GroupDataEvent.LIST_DATA);
		eve.listData = value;
		Dispatcher.dispatch(eve);
	}

		public function get rendererDictionary():Dictionary
		{
			return _rendererDictionary;
		}

		public function set rendererDictionary(value:Dictionary):void
		{
			_rendererDictionary = value;
		}

		public function get destination():DestinationVO
		{
			return _destination;
		}

		public function set destination(value:DestinationVO):void
		{
			_destination = value;
		}
       

	
	
	}
	
}

class ItineraryEnforcer{}