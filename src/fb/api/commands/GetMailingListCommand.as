package fb.api.commands
{
	import flash.data.SQLConnection;
	import fb.services.SQLiteConnector;
	import fb.services.Services;
	
	public class GetMailingListCommand implements ICommand
	{
		private var dbConnection:SQLConnection;
		private var connector:SQLiteConnector;
		
		public function GetMailingListCommand()
		{
			
			connector = SQLiteConnector.getInstance();
			dbConnection = connector.getConnection();
			
		}
		
		public function execute():void
		{
			
			if(connector.hasConnection){
				
				
				var service:Services = new Services();
				service.getMList(dbConnection);
				
			}
			else{
				
				trace("no connection");
			}
		}
	}
}