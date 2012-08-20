package fb.data
{
	
	/*
	Purpose :
	
	To ensure only one trip is held in memory and available at one time
	
	*/
	
	import fb.model.TripVO;

	public class TripData
	{
		
		private static var instance:TripData; 
		private var _tripVO:TripVO;
		
		public function TripData(tripDataEnforcer:TripDataEnforcer)
		{
			
			
		}
		
		public static function getInstance():TripData {
			 
			 if(TripData.instance == null){
				 
				 TripData.instance = new TripData(new TripDataEnforcer);
			 }
			 
			 return TripData.instance;
		 }
		 
		 public function get tripVO():TripVO
		 {
			 return _tripVO;
		 }
		 
		 public function set tripVO(value:TripVO):void
		 {
			 _tripVO = value;
		 }

	}
}


class TripDataEnforcer{}