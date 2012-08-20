package fb.services
{

	import flash.data.SQLConnection;
	import flash.events.Event;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;

	
	
	public class StartUp
	{
		/*
		I have seen embedded assets used like this try for this version
		*/
		[Embed(source="/assets/dpi160/continents/africa.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var AF_PNG:Class;
		
		[Embed(source="/assets/dpi160/continents/asia.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var AS_PNG:Class;
		
		[Embed(source="/assets/dpi160/continents/central_america.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var CA_PNG:Class;
		
		[Embed(source="/assets/dpi160/continents/middle_east.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var ME_PNG:Class;
		
		
		[Embed(source="/assets/dpi160/continents/north_america.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var NA_PNG:Class;
		
		
		[Embed(source="/assets/dpi160/continents/south_america.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var SA_PNG:Class;
		
		[Embed(source="/assets/dpi160/continents/antartica.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var AA_PNG:Class;
		
		[Embed(source="/assets/dpi160/continents/australia.png", scaleGridTop="1", scaleGridLeft="1",scaleGridBottom="10",scaleGridRight="10")]
		[Bindable]
		public static var AUS_PNG:Class;
		
		
		public static var name:String = "DataBaseService";
		public static var DATABASE_NAME:String = "appDB.sqlite";
		private var dbFile:File;
		private var appFile:File;
		private var dbConnection:SQLConnection;
	
		
		public function StartUp()
		{
				//trace("in start up");
				dbFile = File.applicationStorageDirectory.resolvePath(DATABASE_NAME);
				appFile = File.applicationDirectory.resolvePath("assets/db/"+ DATABASE_NAME);
				
				if (!dbFile.exists)
				{
					trace("copy");
					appFile.copyToAsync(dbFile);
					
					appFile.addEventListener(Event.COMPLETE, fileCopiedHandler);
					
				}
				
				else{
					
					makeConnection();
				}
				
				
		}
		
       private function fileCopiedHandler(e:Event):void{
		  
		   makeConnection();
		 }
		
	   
	   private function makeConnection():void{
		   trace("connect");
		   var connector:SQLiteConnector = SQLiteConnector.getInstance();

		   connector.dbLocation = dbFile;
		   dbConnection = connector.getConnection();
		 if(dbConnection.connected){
			 
			 trace("connected !");
		 }
	   }
	   
	  
	}
}