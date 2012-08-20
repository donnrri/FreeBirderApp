package fb.model
{
	public class TripVO
	{
		
		private var _name:String;
		private var _comments:String;
		private var _fromDate:Date;
		private var _toDate:Date;
		private var _tripDays:Vector.<DayVO>;
		
		
		public function TripVO()
		{
			tripDays = new Vector.<DayVO>();
			
		}

		public function get toDate():Date
		{
			return _toDate;
		}

		public function set toDate(value:Date):void
		{
			_toDate = value;
		}

		public function get fromDate():Date
		{
			return _fromDate;
		}

		public function set fromDate(value:Date):void
		{
			_fromDate = value;
		}

		public function get comments():String
		{
			return _comments;
		}

		public function set comments(value:String):void
		{
			_comments = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get tripDays():Vector.<DayVO>
		{
			return _tripDays;
		}

		public function set tripDays(value:Vector.<DayVO>):void
		{
			_tripDays = value;
		}

       public function setDay(day:DayVO):void{
		   
		   _tripDays.push(day);
	   }
	   
	   public function removeDayByDate(day:String, month:String):void{
		
		   var limit:int = _tripDays.length;
		  var dObj:DayVO = new DayVO();
		  for(var i:int =0; i < limit; ++i){
			  
			  dObj = _tripDays[i] as DayVO;
			  
			  if(day == dObj.day){
				  
				  if(month == dObj.month){
					  
					  _tripDays.splice(i, 0);
				  }
			  }
			  
		  }
	   }
	}
}