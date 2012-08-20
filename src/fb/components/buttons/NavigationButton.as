package fb.components.buttons
{
	import fb.events.NavigationEvent;
	
	import flash.display.GradientType;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.AntiAliasType;
	
	import mx.core.FlexGlobals;
	import mx.styles.StyleManager;
	
	import skins.NavigationButtonSkin;
	
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	import spark.components.TextArea;
	import spark.components.supportClasses.StyleableTextField;
	import spark.components.supportClasses.TextBase;
	
	public class NavigationButton extends SkinnableContainer
	{
		
		[SkinPart(required="true")] 
		/** 
		 * A skin part that defines the login button. 
		 */ 
		public var textLabel:Label;
		
	   
		
       [Bindable]private var _labelText:String;
		
		
		
		private var awidth:Number;
		private var aheight:Number;
		private var navEvent:NavigationEvent;
		
		public function NavigationButton()
		{
			
			
			this.setStyle("skinClass", NavigationButtonSkin);
			this.width  = awidth;
			this.height = aheight;
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			
			if(instance == textLabel){
				
				textLabel.addEventListener(MouseEvent.CLICK, handleMinimize);
				textLabel.text = _labelText;
			}
			
			
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			
			super.partRemoved(partName, instance);
			
			
			
			if(instance == textLabel){
				
				textLabel.removeEventListener(MouseEvent.CLICK, handleMinimize);
			}
			
		}
		
		
		private function handleMinimize(e:MouseEvent):void{
			
			/*navEvent = new NavigationEvent(NavigationEvent.MAIN_NAVIGATION_BUTTON);
			navEvent.buttonType = "minimize";
			Dispatcher.dispatch(navEvent);*/
		}
		
		private function handleExit(e:MouseEvent):void{
			
			/*navEvent = new NavigationEvent(NavigationEvent.MAIN_NAVIGATION_BUTTON);
			navEvent.buttonType = "exit";
			Dispatcher.dispatch(navEvent);*/
		}

		[Bindable]
		public function get labelText():String
		{
			return _labelText;
		}

		public function set labelText(value:String):void
		{
			_labelText = value;
		}

	}
}