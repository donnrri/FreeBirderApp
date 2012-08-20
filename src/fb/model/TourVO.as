package fb.model
{
	public class TourVO extends BaseDataVO
	{
		
	
		private var _title:String;
		private var _contact:String;
		private var _description:String;
		private var _service:String;
		private var _type:String;
		
		public function TourVO()
		{
			type = Object(this).constructor;
		}

		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}

		public function get contact():String
		{
			return _contact;
		}

		public function set contact(value:String):void
		{
			_contact = value;
		}

		public function get description():String
		{
			return _description;
		}

		public function set description(value:String):void
		{
			_description = value;
		}

		public function get service():String
		{
			return _service;
		}

		public function set service(value:String):void
		{
			_service = value;
		}


	}
}