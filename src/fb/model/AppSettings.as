package fb.model
{
	import spark.core.SpriteVisualElement;
	
	/**
	 *  This class is a singleton which keeps track of any settings the user selects
	 *  
	 *  <p>Settings vaiables of this class take only CONSTANT values "TOP" , "BOTTOM", "LEFT" and "RIGHT" </p>
	 *
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	
	public class AppSettings
	{
		
		
		private static var _instance:AppSettings;
		
		private static const TOP:String = "top";
		private static const BOTTOM:String = "top";
		private static const LEFT:String = "top";
		private static const RIGHT:String = "top";
		
		
		private var _optionSideBar:String;
		
		public function AppSettings(appEnforcer:ApplicationEnforcer)
		{
			
			
		}
		
		public static function getInstance():AppSettings {
			
			if(_instance == null){
				
				_instance = new AppSettings(new ApplicationEnforcer);
			}
			
			return _instance;
		}

		/**
		 *  optionSideBar keeps track of the side bar position selected by user.
		 *  If changed this is automatically updated
		 * 
		 * <p> accepted values only 'top', 'bottom', 'left' or 'right' </p>
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get optionSideBar():String
		{
			return _optionSideBar;
		}

		/**
		 * @private
		 */
		public function set optionSideBar(value:String):void
		{
			if(value == TOP || value == BOTTOM || value == LEFT || value == RIGHT){
			_optionSideBar = value;
			}
			else{
				
				throw new Error("optonsSideBar: argument values can be 'top', 'bottom', 'left' or 'right'"); 
			}
		}

	}
	

}

class ApplicationEnforcer{}