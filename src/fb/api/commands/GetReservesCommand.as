package fb.api.commands
{
	import flash.data.SQLConnection;
	import fb.services.SQLiteConnector;
	import fb.services.Services;
	
	public class GetReservesCommand implements ICommand
	{
		
		private var dbConnection:SQLConnection;
		private var connector:SQLiteConnector;
		
		
		public function GetReservesCommand()
		{
			
			connector = SQLiteConnector.getInstance();
			dbConnection = connector.getConnection();
		}
		
		
		public function execute():void
		{
			if(connector.hasConnection){
				
				
				var service:Services = new Services();
				service.getReserves(dbConnection);
				
			}
			else{
				
				trace("no connection");
			}
			
		}
	}
}