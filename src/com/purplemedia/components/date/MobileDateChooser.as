package com.purplemedia.components.date
{
	import com.purplemedia.components.date.DateChooser;
	import com.purplemedia.components.date.calendarSkin;
	import com.purplemedia.components.date.iconSprite;
	import com.purplemedia.events.Dispatcher;
	import com.purplemedia.events.calendarEvent;
	
	import fb.events.FBErrorEvent;
	import fb.events.ItemSelectionEvent;
	import fb.events.NavigationEvent;
	import fb.model.Itinerary;
	import fb.utils.DateUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.globalization.DateTimeFormatter;
	import flash.globalization.DateTimeStyle;
	import flash.text.AntiAliasType;
	
	import mx.core.FlexGlobals;
	import mx.core.IFactory;
	import mx.events.FlexMouseEvent;
	
	import skins.IconButtonSkin;
	import skins.MobileDateChooserSkin;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	import spark.components.supportClasses.StyleableTextField;
	
	
	public class MobileDateChooser extends SkinnableContainer
	{
		
		
		/*Declaring a dynamic skin part */
		[SkinPart (require="true", type="com.purplemedia.components.date.DateChooser")]
		public var dateChoose:IFactory;
		
		
		[SkinPart (required="true")]
		
		public var startDate:Label;
		
		[SkinPart (required="true")]
		
		public var endDate:Label;
		
		
		[SkinPart (required="true")]
		
		public var startDateIcon:Button;
		
		[SkinPart (required="true")]
		
		public var endDateIcon:Button;
		
		[SkinPart (required="true")]
		
		public var holder:Group;
		
		private static const START_DATE:String  = "Start Date";
		private static const END_DATE:String = "End Date";
		private static const ERROR_CODE:int = -1;
	
		private static const WARNING:String = "Warning: Entered date before start date. ";
		private static const WARN:String = "warning";
		
		
		private var startDateStr:String;
		private var endDateStr:String;
		private var startSelected:Boolean;
		private var endSelected:Boolean;
		private var calendarOpen:Boolean;
		
		public function MobileDateChooser()
		{

			setStyle("skinClass", MobileDateChooserSkin);
			
			startSelected = false;
			endSelected = false;
			calendarOpen = false;
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			
			if(instance == startDate){
				
				startDate.text = START_DATE;
			}
			
			if(instance == endDate){
				
				endDate.text = END_DATE;
			}
			
			if(instance == startDateIcon){
				
				startDateIcon.addEventListener(MouseEvent.CLICK, handleCalendarClick);
			}
			if(instance == endDateIcon){
				
				endDateIcon.alpha = 0.5;
			}
		}
		
		
		private function handleCalendarClick(e:MouseEvent):void{
			
			var dateStr:String = e.target.name;
			setSelection(dateStr);
			setCalendar();
			
		}
		
		protected function setSelection(str:String):void{
			//trace(str + "setSelection " );
			if(str == END_DATE){
				endSelected = true;
			}
			
			if(str == START_DATE)	{
				startSelected = true;
			}
			
		}
		
		private function setCalendar():void{
			if(!calendarOpen){
			
			this.skin.currentState = "disabled";	
			var dateChooser:DateChooser = this.createDynamicPartInstance("dateChoose") as DateChooser;
			dateChooser.addEventListener(calendarEvent.CHANGE, handleChange);
			holder.x = (FlexGlobals.topLevelApplication.width - dateChooser.width) * 0.25;
			holder.addElementAt(dateChooser, 0);
			
			
			}

			calendarOpen = true;
			
		}
		
		private function handleChange(e:calendarEvent):void{
			
			var dateStr:String = e.selectedDate;
		
			this.skin.currentState = "normal";
			calendarOpen = false;
			setDate(dateStr);
			
		}
		
		private function setDate(str:String):void{
			//trace(str + " setDate " +  endSelected  + "   " + startSelected);
			if(endSelected){
				
				endSelected = false;
				endDate.text = str;
				endDateStr = str;
			}
			
			if(startSelected)	{
				
				startSelected = false;
				startDate.text = str;
				startDateStr = str;
				
				endDateIcon.addEventListener(MouseEvent.CLICK, handleCalendarClick);
				endDateIcon.alpha = 1;
			}
			
			checkDates();
		}
		
		
		
		private function checkDates():void{
			
			if(startDateStr != null && endDateStr != null){
				
				var start:String = reverseStr(startDateStr);
				var startDateValue:Date = DateUtil.parseStringDate(start);
				
				var end:String = reverseStr(endDateStr);
				var endDateValue:Date = DateUtil.parseStringDate(end);
				/*	Returns -1 if d1 is greater than d2.
				Returns 1 if d2 is greater than d1.
				Returns 0 if both dates are equal.
				*/
				var isOK:int = DateUtil.compareDates(startDateValue, endDateValue);
				var sameYear:Number = checkYears(startDateValue, endDateValue);
				var errorEve:FBErrorEvent;
				
				if(isOK == ERROR_CODE) {
					
					setWarning();
					errorEve = new FBErrorEvent(FBErrorEvent.INCORRECT_TRIP_DATE);
					dispatchEvent(errorEve);
					
				}
				
					if(sameYear == ERROR_CODE) {
						
						setWarning();
						errorEve  = new FBErrorEvent(FBErrorEvent.INCORRECT_YEAR);
						dispatchEvent(errorEve);
					
						}
			
			
				
						if(isOK != ERROR_CODE && sameYear != ERROR_CODE){
							
							// set the global dates
							var itinerary:Itinerary = Itinerary.getInstance();
							
							itinerary.startDateStr = startDateStr;
							itinerary.endDateStr = endDateStr;
							itinerary.startDate = startDateValue;
							itinerary.endDate = endDateValue;
							var navEve:NavigationEvent = new NavigationEvent(NavigationEvent.FADE_CALENDAR);
							dispatchEvent(navEve);
						}
				}
		}
		
		
		private function checkYears(start:Date, end:Date):Number{
			
			var startYear:Number = start.fullYear;
			var endYear:Number = end.fullYear;
			
			var result:Number = 1;
			if(startYear != endYear){
				
				result = -1;
			}
			
			return result;
		}
		
		
		private function reverseStr(str:String):String{
			
			var returnStr:String = str.split('/').reverse().join('/');
			
			return returnStr;
			
		}
		
		public function getStartDate():String{
			
			var returnString:String;
			returnString = startDateStr;
			
			return returnString;
		}
		
		public function getEndDate():String{
			
			var returnString:String;
			returnString = endDateStr;
			
			return returnString;
		}
		
		public function setStartDate(value:String):void{
			
			startDate.text = value;
			startDateStr = value;
			
		}
		public function setEndDate(value:String):void{
			
			endDate.text = value;
			endDateStr = value;
			
		}
		
		private function setWarning():void{
			
			endDateIcon.skin.currentState = WARN;
			
			endDate.text = WARNING;
			
		}
	}
}