package fb.components.list
{
	import fb.components.renders.AccomodationListItemRenderer;
	import fb.events.Dispatcher;
	import fb.events.OptionsEvent;
	import fb.model.AccomodationVO;
	import fb.model.IDataModel;
	import fb.model.Itinerary;
	import fb.model.ListVO;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.core.ClassFactory;
	import mx.core.IFactory;
	
	import skins.OptionListSkin;
	
	import spark.components.DataGroup;
	import spark.components.Label;
	import spark.components.List;
	import spark.components.SkinnableContainer;
	import spark.events.IndexChangeEvent;
	
	public class OptionsList extends SkinnableContainer
	{
		[SkinPart (required="true")]
		public var optionList:List
		
		[SkinPart (required="true")]
		public var optionLabel:Label;
		
		private var itinerary:Itinerary;
		
		public function OptionsList()
		{
			super();
			
			setStyle("skinClass", OptionListSkin);
			
			itinerary = Itinerary.getInstance();
		}
		
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			// TODO Auto Generated method stub
			super.partAdded(partName, instance);
			
			if(instance == optionList){
				
				optionList.itemRendererFunction = assignRenderer;
			    optionList.addEventListener(IndexChangeEvent.CHANGE,  selectionChangedHandler);
			}
			
		}
		
		protected function selectionChangedHandler(event:IndexChangeEvent):void 
		{ 
			var currentIndx:int = event.currentTarget.selectedIndex; 
			var currentDataItem:Object = event.currentTarget.selectedItem;
			var eve:OptionsEvent = new OptionsEvent(OptionsEvent.SELECTED_ITEM); 
			eve.itemType = currentDataItem.toString();
			eve.title = String(currentDataItem.title);
		//	trace("Dispatchers -- " + eve.title + "  " + eve.itemType + " and index = " + currentIndx);
			Dispatcher.dispatch(eve);
		} 

		
		
		private function assignRenderer(item:IDataModel):IFactory{
			
		      return itinerary.rendererDictionary[optionList.dataProvider[0]]; 
		}
		
		public function setLabel(str:String):void{
			
			optionLabel.text = str;
		}
		
		
		
		public function setList(data:ArrayCollection):void{
			
			
			optionList.dataProvider = data;
			
		}
		
		public function setRenderer(type:ClassFactory):void{
			
			
			optionList.itemRenderer = type;
		}
		
	}
}