package fb.model
{
	public class InformationVO extends BaseDataVO
	{
		
		private var _title:String;
		private var _link:String;
		
		
		public function InformationVO()
		{
			super();
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


	}
}