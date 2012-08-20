package fb.components
{

	import fb.proxies.CountryProxy;
	import fb.components.renders.LetterRenderer;
	
	import mx.collections.ArrayCollection;
	import mx.core.ClassFactory;
	
	import spark.components.DataGroup;
	import spark.components.List;
	import spark.components.SkinnableContainer;
	import spark.components.supportClasses.Skin;
	import spark.layouts.TileLayout;
	import spark.layouts.HorizontalLayout;
	
	
	
	public class CountryPicker extends SkinnableContainer
	{
		
		private var countryMap:Object;
		private var awidth:Number;
		private var aheight:Number;
		private var letters:Array;
		private var letterCollection:ArrayCollection;
		private var countryCollection:ArrayCollection;
		private var regionCollection:ArrayCollection;
		private var renderer:LetterRenderer;
		
		
		var picker:DataGroup;
		
		public function CountryPicker()
		{
			
			// make an instance of our proxy class which implements lazy loading of data when required
			
			var country:CountryProxy = new CountryProxy();
			letters = country.getLetters();
			//trace("letters are -- " + letters);
			
		    countryCollection = new ArrayCollection();
			countryCollection = country.getCountry("A");
			//trace("here is country collection " + countryCollection.toString());
			
			regionCollection = country.getRegions("United States of America");
			trace("here is regions collection " + regionCollection.toString());
		}
		
		override protected function createChildren():void
		{
			
			super.createChildren();
			
			picker = new DataGroup();
			
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			// TODO Auto Generated method stub
			super.partAdded(partName, instance);
			
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			// TODO Auto Generated method stub
			super.partRemoved(partName, instance);
		}
		
		override protected function commitProperties():void
		{
			// TODO Auto Generated method stub
			super.commitProperties();
			
			trace("commitProperties");
			letterCollection = new ArrayCollection(letters);
			
			picker.dataProvider = letterCollection;
			picker.itemRenderer = new ClassFactory(fb.components.renders.LetterRenderer);
			
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// TODO Auto Generated method stub
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			awidth = unscaledWidth;
			aheight = unscaledHeight;
			trace("update dl");
			picker.width = (awidth/ 10) * 9;
			picker.height = (aheight/2);
			
			picker.layout = new TileLayout();
			addElement(picker);
		}
		
		
	}
}