package fb.api.commands
{
	import flash.data.SQLConnection;
	import fb.services.SQLiteConnector;
	import fb.services.Services;
	
	public class GetObservatoriesCommand implements ICommand
	{
		
		private var dbConnection:SQLConnection;
		private var connector:SQLiteConnector;
		
		
		public function GetObservatoriesCommand()
		{
			
			connector = SQLiteConnector.getInstance();
			dbConnection = connector.getConnection();
		}
		
		public function execute():void
		{
			if(connector.hasConnection){
				
				
				var service:Services = new Services();
				service.getObservatories(dbConnection);
				
			}
			else{
				
				trace("no connection");
			}
			
		}
	}
}