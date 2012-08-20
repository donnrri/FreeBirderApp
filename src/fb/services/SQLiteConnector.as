package fb.services
{
	public class SQLiteConnector
	{
		
		import flash.data.SQLConnection;
		
		import flash.data.SQLMode;
		
		import flash.data.SQLResult;
		
		import flash.data.SQLStatement;
		
		import flash.events.SQLErrorEvent;
		
		import flash.events.SQLEvent;
		
		import flash.filesystem.File;
		
	
		
			
			private static var instance :SQLiteConnector;
			
			private var _dbLocation:File;
			
			private var _connection:SQLConnection;
			
			private var _callBackFunction:Function;
			
			private var _hasConnection:Boolean;
			
			public static function getInstance():SQLiteConnector
				
			{
				
				if ( instance == null ) {
					instance = new SQLiteConnector();
				}
						
				return instance;
				
			}
			
			/**
			 
			 * Specify the path to the SQLite database 
			 
			 */
			
			public function set dbLocation(location:File): void {
				
				_dbLocation = location;
				
			}
			
			/**
			 
			 * This will always return the same connection to the db
			 
			 * @return SQLConnection
			 
			 */
			
			public function getConnection():SQLConnection { 
				
				if(_dbLocation == null) {
					
					throw new Error("You must first specify a path to the SQLite Database."); 
					return ; 
				} 
				if(_connection == null) {
					
					//trace("open conection");
					_connection = new SQLConnection();
					//trace(_dbLocation.exists);
					_connection.openAsync(_dbLocation);
					
					_connection.addEventListener(SQLEvent.OPEN, connectSuccess);
					_connection.addEventListener(SQLErrorEvent.ERROR, onSQLError);
				}
				
				return _connection;
				
			}
			
			/**
			 
			 * Set the _hasConnection variable to true
			 
			 * @param e
			 
			 */
			
			private function connectSuccess(e:SQLEvent): void {
				
				_hasConnection = true;
				
				//trace("success here");
			}
			
			/**
			 
			 * Returns whether the SQLiteConnector already
			 
			 * has a connection or not
			 
			 * @return Boolean
			 
			 */
			
			public function get hasConnection():Boolean
				
			{
				
				return _hasConnection;
				
			}
			
			/**
			 
			 * Catch any SQLite errors during runtime
			 
			 * @param e
			 
			 */
			
			private function onSQLError(e:SQLErrorEvent):void {
				
				trace("connection error " + e.error.message);
				
			}
			
		}
		
	}
