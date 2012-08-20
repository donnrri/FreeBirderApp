package fb.components.list
{
	import fb.components.renders.CalendarListItemRenderer;
	import fb.events.CalendarEvent;
	import fb.events.Dispatcher;
	import fb.model.DayVO;
	
	import mx.collections.ArrayCollection;
	import mx.core.ClassFactory;
	import mx.core.IFactory;
	
	import skins.CalendarListSkin;
	
	import spark.components.DataGroup;
	import spark.components.Label;
	import spark.components.List;
	import spark.components.SkinnableContainer;
	import spark.events.IndexChangeEvent;
	
	public class CalendarList extends SkinnableContainer
	{
		[SkinPart (required="true")]
		public var calendarList:List;
		
		[SkinPart (required="true")]
		public var optionLabel:Label;
		
		
		
		
		private var dataColl:ArrayCollection;
		
		public function CalendarList()
		{
			super();
			
			setStyle("skinClass", CalendarListSkin);
			
		}
		
		protected function selectionChangedHandler(event:IndexChangeEvent):void 
		{ 
			var currentIndx:int = event.currentTarget.selectedIndex; 
			var currentDataItem:Object = event.currentTarget.selectedItem; 
			//trace("INDEX CHANGE EVENT -> FIRED  ");
			var eve:CalendarEvent = new CalendarEvent(CalendarEvent.ADD_ITEM);
		    eve.index = currentIndx; 
			Dispatcher.dispatch(eve);
		} 

		
		override protected function partAdded(partName:String, instance:Object):void
		{
			// TODO Auto Generated method stub
			super.partAdded(partName, instance);
			
			if(instance == calendarList){
				
			 calendarList.addEventListener(IndexChangeEvent.CHANGE, selectionChangedHandler);
			}
			
		}
		
		
		public function setList(data:ArrayCollection):void{
			
		dataColl = data;	
		calendarList.dataProvider = data;
			
		}
		
		public function setCalendar(index:int, type:String, item:String):void{
			
			trace("set calendar .." );
			var day:DayVO= calendarList.dataProvider[index] as DayVO;
			
			day.setDayData(type, item);
			
			calendarList.dataProvider.removeItemAt(index);
			calendarList.dataProvider.addItemAt(day, index);
			
			calendarList.invalidateProperties();
			
		}
		
		
		public function setCalendarRange(start:int, end:int, type:String, item:String):void{
			
			var i:int = start;
			var limit:int = end + 1;
			
			for(i ; i< limit; ++i)
			{
				
				var day:DayVO= calendarList.dataProvider[i] as DayVO;
				
				day.setDayData(type, item);
				calendarList.dataProvider.removeItemAt(i);
				calendarList.dataProvider.addItemAt(day, i);
			}
			
			calendarList.invalidateProperties();
		}
		
		public function getList():ArrayCollection {
			
			return dataColl;
		}
		
	}
}