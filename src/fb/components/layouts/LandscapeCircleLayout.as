package fb.components.layouts
{
	import flash.geom.Point;
	
	import mx.core.ILayoutElement;
	
	import spark.components.supportClasses.GroupBase;
	import spark.layouts.supportClasses.LayoutBase;
	
	public class LandscapeCircleLayout extends LayoutBase
	{
		
		private static const SIZE:Number = 50;
		private var _angles:Vector.<Number>;
		private var _xOffset:Number;
		private var _yOffset:Number;
		private var _radius:Number;
		
		public function LandscapeCircleLayout()
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
			
			
			_radius = (height/1.5);
			_angles = new Vector.<Number>();
			_xOffset= width/2;
			_yOffset = height/2;
			
			var i:int = 0;
			
			//start looping through each element i.e each child
			for(var a:Number = Math.PI*2; a > 0; a-=Math.PI*2/childsCount){
				//get the current element
				//NOTE: ILayoutElement interface is used primarily by the layout
				//classes to query, size and position the elements of the GroupBase based containers.
				
				
				var currentElement:ILayoutElement = targetContainer.getElementAt(i);
				//use setLayoutBoundsSize method and pass NAN values, so that the element
				//will bet get drawn with its prefered height and width
				currentElement.setLayoutBoundsSize(SIZE, SIZE);
				var xVal:Number = xOffset + (Math.cos(a)*radius);//xOffset + 
				var yVal:Number = yOffset + (Math.sin(a)*radius); // yOffset +  
				
			
				_angles.push(a);
				
				currentElement.setLayoutBoundsPosition(xVal, yVal);
				
				i++;
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