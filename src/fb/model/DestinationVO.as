package fb.model
{
	[Bindable]
	public class DestinationVO
	{
		private var _country:String;
		private var _destination:String;
		private var _hasFestivals:Boolean;
		private var _festivals:Array;
		
		public function DestinationVO()
		{
			
			festivals = new Array();
		}

		public function get country():String
		{
			return _country;
		}

		public function set country(value:String):void
		{
			_country = value;
		}

		public function get destination():String
		{
			return _destination;
		}

		public function set destination(value:String):void
		{
			_destination = value;
		}

		public function get hasFestivals():Boolean
		{
			return _hasFestivals;
		}

		public function set hasFestivals(value:Boolean):void
		{
			_hasFestivals = value;
		}

		public function get festivals():Array
		{
			return _festivals;
		}

		public function set festivals(value:Array):void
		{
			_festivals = value;
		}


	}
}