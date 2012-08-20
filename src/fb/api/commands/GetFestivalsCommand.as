package fb.api.commands
{

	import flash.data.SQLConnection;
	import fb.services.SQLiteConnector;
	import fb.services.Services;
	
	public class GetFestivalsCommand implements ICommand
	{
		

		private var dbConnection:SQLConnection;
		private var connector:SQLiteConnector;
		
		public function GetFestivalsCommand()
		{
			
			connector = SQLiteConnector.getInstance();
			dbConnection = connector.getConnection();
		}
		
		public function execute():void
		{
			
			if(connector.hasConnection){
				
				var service:Services = new Services();
				service.getFestivals(dbConnection);
				
			}
			else{
				
				trace("no connection");
			}
		}
	}
}