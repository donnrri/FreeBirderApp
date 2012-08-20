package fb.api.commands
{
	import flash.data.SQLConnection;
	import fb.services.SQLiteConnector;
	import fb.services.Services;
	
	
	public class GetToursCommand implements ICommand
	{
		private var dbConnection:SQLConnection;
		private var connector:SQLiteConnector;
		
		
		public function GetToursCommand()
		{
			
			connector = SQLiteConnector.getInstance();
			dbConnection = connector.getConnection();
		}
		
		public function execute():void
		{
			
			if(connector.hasConnection){
				
				
				var service:Services = new Services();
				service.getTours(dbConnection);
				
			}
			else{
				
				trace("no connection");
			}
		}
	}
}