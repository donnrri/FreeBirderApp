package fb.components.layouts
{
	import flash.geom.Point;
	
	import mx.core.ILayoutElement;
	
	import spark.components.supportClasses.GroupBase;
	import spark.layouts.supportClasses.LayoutBase;
	
	public class PortriatCircleLayout extends LayoutBase
	{
		
		private static const PADDING:Number = 80;
		private static const SIZE:Number = 10;
		private var _xOffset:Number;
		private var _yOffset:Number;
		private var _radius:Number;
		
		private var _angles:Vector.<Number>;
		
		public function PortriatCircleLayout()
		{
			super();
			
		
		}
		
		
		override public function updateDisplayList(width:Number, height:Number):void
		{
			super.updateDisplayList(width,height);
			//make sure that target i.e container which is using this layout, is not null
			if (!target)
				return;
			//get the reference of target container which is using this layout
			var targetContainer:GroupBase = target;
		
			//get the count of elements
			var childsCount:int = targetContainer.numElements;
			
			
			 _radius = (width / 3);
			 _angles = new Vector.<Number>();
			 _xOffset = (width/4) + PADDING;
			 _yOffset = height/4;
			
			
             var i:int = 0;
			
			//start looping through each element i.e each child
			 if(childsCount > 0){
				
				 for(var a:Number = Math.PI*2; a > 0; a-=Math.PI*2/childsCount){
					 //get the current element
					 //NOTE: ILayoutElement interface is used primarily by the layout
					 //classes to query, size and position the elements of the GroupBase based containers.
					 
					
					 var currentElement:ILayoutElement = targetContainer.getElementAt(i);
					 //use setLayoutBoundsSize method and pass NAN values, so that the element
					 //will bet get drawn with its prefered height and width
					 
					 //currentElement.setLayoutBoundsSize(NaN,NaN);
					 var xVal:Number = (Math.cos(a)*radius) + xOffset ; //xOffset + 
					 var yVal:Number = (Math.sin(a)*radius) + yOffset ; //yOffset + 
					 
					 _angles.push(a);
					 currentElement.setLayoutBoundsPosition(xVal, yVal);
				
					 i++;
				 }
			 }
		}
		
		override public function measure():void{
			
			
			if (!target)
				return;
			
			
			var targetContainer:GroupBase = target;
			var childsCount:int = targetContainer.numElements;
			
			for(var a:Number = 0; a > childsCount; a++){
				
				var currentElement:ILayoutElement = targetContainer.getElementAt(a);
				currentElement.setLayoutBoundsSize(SIZE, SIZE);
				
			}
		}

		public function get angles():Vector.<Number>
		{
			return _angles;
		}

		public function set angles(value:Vector.<Number>):void
		{
			_angles = value;
		}

		public function get xOffset():Number
		{
			return _xOffset;
		}

		public function set xOffset(value:Number):void
		{
			_xOffset = value;
		}

		public function get yOffset():Number
		{
			return _yOffset;
		}

		public function set yOffset(value:Number):void
		{
			_yOffset = value;
		}

		public function get radius():Number
		{
			return _radius;
		}

		public function set radius(value:Number):void
		{
			_radius = value;
		}
		
		
	}
}