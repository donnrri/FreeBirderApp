package fb.model
{
	public class AccomodationVO extends BaseDataVO 
	{
		
		private var _title:String;
		private var _description:String;  
		private var _link:String;
	
		
		public function AccomodationVO()
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

		public function get link():String
		{
			return _link;
		}

		public function set link(value:String):void
		{
			_link = value;
		}

		public function get description():String
		{
			return _description;
		}

		public function set description(value:String):void
		{
			_description = value;
		}

 
	   
	   
	}
}