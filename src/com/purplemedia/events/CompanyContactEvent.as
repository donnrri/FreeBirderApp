package com.purplemedia.events
{
	
	import flash.events.Event;
	
	public final class CompanyContactEvent extends Event
	{
		public static const GETRECORD:String= "get record";
		public static const SAVERECORD:String = " save record";
		public static const NEWRECORD:String = "new record";
		public static const ADDCONTACT:String = "new contact";
		public static const CHANGE:String = "change";
		public static const NEWSITE:String = "new site";
		public static const COMPANYSELECTED:String = " comapny selected";
		public static const UPDATEINDUSTRY:String ="update form";
		public static const UPADATECONTACT:String = " upadte contact";
		public static const UPDATEPOSITION:String = "update position";
		public static const UPDATETELEPHONE:String = " update telephone";
		public static const UPDATEEMAIL:String = " update email";
		public static const UPDATESITES:String = " update sites";
		public static const UPDATECONTACT:String = "update contact";
		public static const ITEMSELECTED:String = "item selected";
		
		public static const SAVE_ENTERED_SITE:String = "save entered site";
		public static const SAVE_ENTERED_COMPANY:String = "save entered company";
		public static const SAVE_CURRENT_COMMUNICATION:String = "save current communication";
		public static const SAVE_ENTERED_CONTACT:String = "save entered contact";
		public static const NO_COMAPNY:String = "no company";
		public static const INPUT_CHANGED:String = "input changed";
		public static const MODE_CHANGE:String = "mode change";
		public static const NEW_COMPANY_SAVED:String = "current communications saved";
		public static const SELECTED_INDEX:String = "selected index";
		public static const DATECHANGE:String = "date chenged";
	
		private var _buttonType:String;
		private var _input:String;
		private var _companyName:String;
		private var _selectedItem:String;
		private var _selectedType:String;
		private var _selectedIndex:int;
		private var _saveItem:Boolean;
		private var _data:Array;
		private var _mode:String;
		/**
		 * 
		 * @param type
		 * 
		 */
		public function CompanyContactEvent( type:String ):void
		{
			super( type);
			
			data = new Array();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Overrides
		//
		//--------------------------------------------------------------------------
		
	
		
		public function get input():String
		{
			return _input;
		}

		public function set input(value:String):void
		{
			_input = value;
		}

		public function get selectedIndex():int
		{
			return _selectedIndex;
		}

		public function set selectedIndex(value:int):void
		{
			_selectedIndex = value;
		}

		public function get mode():String
		{
			return _mode;
		}

		public function set mode(value:String):void
		{
			_mode = value;
		}

		public function get buttonType():String
		{
			return _buttonType;
		}

		public function set buttonType(value:String):void
		{
			_buttonType = value;
		}

		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new CompanyContactEvent( type );
		}

		public function get companyName():String
		{
			return _companyName;
		}

		public function set companyName(value:String):void
		{
			_companyName = value;
		}

		public function get data():Array
		{
			return _data;
		}

		public function set data(value:Array):void
		{
			_data = value;
		}

		public function get selectedItem():String
		{
			return _selectedItem;
		}

		public function set selectedItem(value:String):void
		{
			_selectedItem = value;
		}

		public function get selectedType():String
		{
			return _selectedType;
		}

		public function set selectedType(value:String):void
		{
			_selectedType = value;
		}

		public function get saveItem():Boolean
		{
			return _saveItem;
		}

		public function set saveItem(value:Boolean):void
		{
			_saveItem = value;
		}
		
		
	}
}