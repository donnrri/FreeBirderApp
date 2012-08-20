package fb.components.sideBars
{
	import fb.components.labels.IconLabel;
	import fb.events.OptionsEvent;
	import fb.events.Dispatcher;
	import fb.model.ListVO;
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.IFactory;
	
	import skins.OptionButtonSkin;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	
	
	public class OptionSideBar extends SkinnableContainer
	{
		
		[SkinPart (require="true", type="fb.components.label.IconLabel")]
		public var optionLabels:IFactory;
		
		
		[SkinPart (required="true")]
		public var optionLabel:Label;
		
		[SkinPart (required="true")]
		public var buttonGroup:Group;
		
		
		private static const OPTIONS:String = "Options";
		private var _data:ArrayCollection;
		private var dataLength:int;
		
		public function OptionSideBar()
		{
			super();
			
			setStyle("skinClass", OptionButtonSkin);
			
			data = new ArrayCollection();
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			// TODO Auto Generated method stub
			super.partAdded(partName, instance);
			
			if(instance == optionLabel){
				
				optionLabel.text = OPTIONS;
				
			}
			
		}
		
		
		public function get data():ArrayCollection
		{
			return _data;
		}

		public function set data(value:ArrayCollection):void
		{
			_data = value;
			dataLength = _data.length
			if(_data.length > 0){
			setButtons();
			}
		}

		private function setButtons():void{
			
				for(var i:int = 0; i < dataLength; ++i)
				{
					var oLabel:IconLabel= createDynamicPartInstance("optionLabels")
						as IconLabel;
					oLabel.id = _data[i].name;
					oLabel.labelText = _data[i].name;
					oLabel.iconSource = _data[i].path;
					oLabel.width = 250;
					oLabel.height = 60;
					oLabel.x = 5;
					oLabel.y = (80 *i) + 40;
					oLabel.addEventListener(MouseEvent.CLICK, handleSelection);
					// Add our new skin part to the breadcrumbBar
					buttonGroup.addElement(oLabel);
				}
		}
		
		private function handleSelection(e:MouseEvent):void{
			
			var eve:OptionsEvent = new OptionsEvent(OptionsEvent.ITEM_SELECTED);
			eve.item = e.currentTarget.id;
			
			Dispatcher.dispatch(eve);
			
			
			
			//trace(eve.item + " eve.item " );
		}
	}
}