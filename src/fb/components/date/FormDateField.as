package fb.components.date
{
	import fb.components.date.DateChooser;
	import fb.components.date.calendarSkin;
	import fb.components.date.iconSprite;
	//import fb.events.CompanyContactEvent;
	import fb.events.Dispatcher;
	import fb.events.CalendarEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.globalization.DateTimeFormatter;
	import flash.globalization.DateTimeStyle;
	
	import mx.events.FlexMouseEvent;
	import mx.core.FlexGlobals;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	
	public class FormDateField extends SkinnableContainer
	{
		[Embed(source='fb/components/date/asset/icon.png')]
		public static var iconClass:Class;
		
		
		
		private var dateString:String;
		private var dateDisplay:Label;
		private var dateChoose:DateChooser;
		private var calendarIcon:Button;
		
		private var calendar:DateChooser;
		
		
		public function FormDateField()
		{
			super();
			dateDisplay = new Label();
			dateDisplay.width = 100;
			dateDisplay.height = 40;
			dateDisplay.x = 0;
			dateDisplay.y = 0;
			this.addElement(dateDisplay);
			
			calendarIcon = 	new Button();
			calendarIcon.setStyle("icon", iconClass);
			calendarIcon.width = 40;
			calendarIcon.height= 40;
			calendarIcon.x = 120;
			calendarIcon.y = 0;
			calendarIcon.addEventListener(MouseEvent.CLICK, handleCalendarClick);
			this.addElement(calendarIcon);
			//disable();
		}
		
		public function getData():String{
			
			var returnString:String;
			//returnString = this.selectedDate.getDate() + " " + this.selectedDate.getMonth() + " " + this.selectedDate.getFullYear();
			returnString = dateString;
			
			return returnString;
		}
		
		
		public function setData(value:String):void{
			
			dateDisplay.text = value;
			dateString = value;
			
		}
		
		private function formatLabel(item:Date):String{
			
			var shortDate:String = null;
			//var item:Date = this.selectedDate;
			if(item != null) {
				var locale:String = "en-US"; //,model.country
				if(locale != null){
					
					var dtf:DateTimeFormatter = new DateTimeFormatter(locale);
					
					dtf.setDateTimeStyles(DateTimeStyle.SHORT, DateTimeStyle.NONE);
					shortDate = dtf.format(item);
					
				}   
			}
			dateString = shortDate;
			return shortDate;
			
		}
		
		public function disable():void{
			
			//dateDisplay.editable = false;
		}
		
		
		public function enable():void{
			
			//dateDisplay.enabled = true;
		}
		public function clearData():void{
			
			dateDisplay.text = "";
		}
		
		private function handleClick(e:CalendarEvent):void{
			
			dateDisplay.text = dateChoose.selectedDate;
			dateString = dateChoose.selectedDate;
		}
		
		private function handleCalendarClick(e:MouseEvent):void{
			
			calendar = new DateChooser();
			calendar.xVal = e.localX;
			calendar.yVal = e.localY;
			calendar.target = e.target;
			//calendar.showCalendar();
			calendar.y = -200;
			calendar.addEventListener(CalendarEvent.CHANGE, handleChange);
			//ADDED BY JOHN
			calendar.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, calendarMouseDownOutsideHandler);
			addElement(calendar);
		}
		
		
		private function handleChange(e:CalendarEvent):void{
			
			//dateDisplay.text = e.selectedDate;
			//dateString = e.selectedDate;  trace(e.selectedDate + " 88888888888888888888888");
			
			setData(e.selectedDate);
			//var eve:CompanyContactEvent = new CompanyContactEvent(CompanyContactEvent.DATECHANGE);
			//Dispatcher.dispatchEvent(eve);
		}
		
		
		//ADDED BY JOHN
		private function calendarMouseDownOutsideHandler(event:FlexMouseEvent):void
		{
			trace("calendarMouseDownOutsideHandler")
			FlexGlobals.topLevelApplication.removeElement(calendar);
		}
	}
}