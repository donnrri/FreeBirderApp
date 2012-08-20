package com.purplemedia.components.date
{
	import com.purplemedia.components.date.DateChooser;
	import com.purplemedia.components.date.calendarSkin;
	import com.purplemedia.components.date.iconSprite;
	import com.purplemedia.events.CompanyContactEvent;
	import com.purplemedia.events.Dispatcher;
	import com.purplemedia.events.calendarEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.globalization.DateTimeFormatter;
	import flash.globalization.DateTimeStyle;
	import flash.text.AntiAliasType;
	
	import mx.core.FlexGlobals;
	import mx.events.FlexMouseEvent;
	
	import skins.IconButtonSkin;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.supportClasses.StyleableTextField;
	
	public class FormDateField extends Group
	{
		//[Embed(source='com/purplemedia/components/date/asset/calendar.png')]
		//public static var iconClass:Class;
		
		private static const BUTTON_SIZE:uint = 50;
		private static const LABEL_WIDTH:uint = 100;
		private static const LABEL_HEIGHT:uint = 40;
		
		protected var textLabel:StyleableTextField;
		private var dateString:String;
		private var dateDisplay:Label;
		private var dateChoose:DateChooser;
		private var calendarIcon:Button;
		
		private var calendar:DateChooser;
		
		
		public function FormDateField()
		{
			super();
		/*	dateDisplay = new Label();
			dateDisplay.width = 100;
			dateDisplay.height = 40;
			
			dateDisplay.x = 0;
			dateDisplay.y = 20;
			this.addElement(dateDisplay);*/
			
			/*calendarIcon = 	new Button();
		
			calendarIcon.setStyle("skinClass", IconButtonSkin);

			calendarIcon.addEventListener(MouseEvent.CLICK, handleCalendarClick);*/
			
			disable();
		}
		
		public function getData():String{
			
			var returnString:String;
			//returnString = this.selectedDate.getDate() + " " + this.selectedDate.getMonth() + " " + this.selectedDate.getFullYear();
			returnString = dateString;
			
			return returnString;
		}
		
		
		public function setData(value:String):void{
			
		    textLabel.text = value;
			dateString = value;
			
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// TODO Auto Generated method stub
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			textLabel.width  = LABEL_WIDTH;
			textLabel.height = LABEL_HEIGHT;
			
			calendarIcon.width  = BUTTON_SIZE;
			calendarIcon.height = BUTTON_SIZE;
			calendarIcon.x = textLabel.width + 10;
			calendarIcon.y = 0;
		}
		
		
		override protected function createChildren():void
		{
			// TODO Auto Generated method stub
			super.createChildren();
			if (!textLabel)
			{
				textLabel = createLabel();
				textLabel.text = " Hi " ;
				//clabel.styleDeclaration = styleManager.getStyleDeclaration(".stationText1");
				//textLabel.filters = [subtleDropShadow];
			}
			
			if(!calendarIcon){
				
				calendarIcon = createIconButton();
			}
			
			
		}
		
		protected function createLabel():StyleableTextField
		{
			var lbl:StyleableTextField = StyleableTextField(createInFontContext(StyleableTextField));
			lbl.editable = false;
			lbl.selectable = false;
			lbl.multiline = false;
			lbl.wordWrap = false;
			lbl.antiAliasType = AntiAliasType.ADVANCED;
			lbl.width = 100;
			lbl.height = 50;
			addElement(lbl);
			return lbl;
		}
		
		
		protected function createIconButton():Button{
			
			var but:Button = new Button();
			but.setStyle("skinClass", IconButtonSkin);
			but.addEventListener(MouseEvent.CLICK, handleCalendarClick);
			addElement(but); 
			return but;
			
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
		
		private function handleClick(e:calendarEvent):void{
			
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
			calendar.addEventListener(calendarEvent.CHANGE, handleChange);
			//ADDED BY JOHN
			calendar.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, calendarMouseDownOutsideHandler);
			addElement(calendar);
		}
		
		
		private function handleChange(e:calendarEvent):void{
			
			//dateDisplay.text = e.selectedDate;
			//dateString = e.selectedDate;  trace(e.selectedDate + " 88888888888888888888888");
			
			setData(e.selectedDate);
			var eve:CompanyContactEvent = new CompanyContactEvent(CompanyContactEvent.DATECHANGE);
			Dispatcher.dispatchEvent(eve);
		}
		
		
		//ADDED BY JOHN
		private function calendarMouseDownOutsideHandler(event:FlexMouseEvent):void
		{
			trace("calendarMouseDownOutsideHandler")
			removeElement(calendar);
		}
	}
}