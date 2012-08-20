package fb.api.invoker
{
	import spark.components.Button;

	public class CommandInvoker
	{
		
		import fb.api.commands.*;
		
		import flash.utils.Dictionary;
		
		import mx.core.ClassFactory;
		import mx.core.IFactory;
		
		public static const ERROR:String = "error";
		
		private static const GET_TOURS:String = "Tours and Guides";
		private static const GET_ACCOMODATION:String = "Places to Stay";
		private static const GET_VISIT:String = "Places to Visit";
        private static const GET_OBSERVE:String = "Observatories";
		private static const GET_RESERVE:String = "Reserves";
	    private static const GET_MAILING_LIST:String = "Mailing List";
		private static const GET_FESTIVAL:String = "get festival";
		private static const GET_MUSEUMS:String = "museum";
		private static var commands:Dictionary;
		
		private static function getDictionary():void
		{
			
			if (commands){
				return;
			} 
			else{
				
				commands = new Dictionary(true);
				commands[GET_FESTIVAL] = new GetFestivalsCommand();
				commands[ERROR] = new ErrorCommand();
				commands[GET_ACCOMODATION] = new GetAccomodationCommand();
				commands[GET_TOURS] = new GetToursCommand();
				commands[GET_OBSERVE] = new GetObservatoriesCommand();
				commands[GET_RESERVE] = new GetReservesCommand();
				commands[GET_MAILING_LIST] = new GetMailingListCommand();
				commands[GET_MUSEUMS] = new GetMuseumCommand();
				
			}
				
		}
		
		public static function invokeCommand(command:String):ICommand
		{
			getDictionary();
			
			if (commands[command] is ICommand) {
			
				return commands[command] as ICommand;
			}
				
			else
				return commands[ERROR] as ICommand;
		}
		
		
		public static function setCommand(commandStr:String, command:ICommand):void{
			
			if(!commands[commandStr]){
				
				command[commandStr] = command;
			}
			
			else{
				
				trace("the value already exists ");
			}
			
		}
	}
}