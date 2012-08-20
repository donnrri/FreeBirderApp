package fb.model
{
	public class MailingListVO extends BaseDataVO
	{
		
		private var _title:String;
		private var _link:String;
		private var _group_email:String;
		private var _person_email:String;
		private var _subscribe:String;
		private var _unsubscribe:String;
		private var _subject:String;
		private var _message:String;
		private var _description:String;
		
		
		public function MailingListVO()
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

		public function get group_email():String
		{
			return _group_email;
		}

		public function set group_email(value:String):void
		{
			_group_email = value;
		}

		public function get person_email():String
		{
			return _person_email;
		}

		public function set person_email(value:String):void
		{
			_person_email = value;
		}

		public function get subscribe():String
		{
			return _subscribe;
		}

		public function set subscribe(value:String):void
		{
			_subscribe = value;
		}

		public function get unsubscribe():String
		{
			return _unsubscribe;
		}

		public function set unsubscribe(value:String):void
		{
			_unsubscribe = value;
		}

		public function get subject():String
		{
			return _subject;
		}

		public function set subject(value:String):void
		{
			_subject = value;
		}

		public function get message():String
		{
			return _message;
		}

		public function set message(value:String):void
		{
			_message = value;
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