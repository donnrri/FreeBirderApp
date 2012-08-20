package fb.services
{
	
	import fb.events.Dispatcher;
	import fb.events.ServiceEvent;
	import fb.model.AccomodationVO;
	import fb.model.FestivalVO;
	import fb.model.InformationVO;
	import fb.model.Itinerary;
	import fb.model.MailingListVO;
	import fb.model.MuseumVO;
	import fb.model.ObservatoryVO;
	import fb.model.ReserveVO;
	import fb.model.TourVO;
	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;
	
	
	public class Services extends EventDispatcher

	{
		
		private static const LIKE:String = "%";
		private var sqlConn:SQLConnection;
		private var sqlStatement:SQLStatement;
		private var country:String;
		
		
		public static const OPEN:String = "open";
		public static const CLOSE:String = "close";
		public static const ERROR:String = "error";

		private static const ACCOMODATION:String = "accomodation";
		private static const TOURS:String = "tours";
		private static const RESERVES:String = "reserves";
		private static const OBSERVATORIES:String = "observatories";
		private static const MAILING_LIST:String = "mailing list";
		private static const MUSEUMS:String = "museum";
		private static const FESTIVAL:String = "festival";
		private static const NULL:String = "null";
		
        private var reserveData:Vector.<ReserveVO>;
	    private var observatoryData:Vector.<ObservatoryVO>;
		private var museumData:Vector.<MuseumVO>;
		private var mailListData:Vector.<MailingListVO> 
		//////////////////staements //////////////////
		
		private var getHotelsStmt:SQLStatement;
		
		
		public static var DATABASE_NAME:String = "appDB.sqlite";
		
		private var dbFile:File;
		
		
		public function Services()
		{
			
			
			//dbFile = File.applicationStorageDirectory.resolvePath(DATABASE_NAME);
			country = Itinerary.getInstance().destination.country;
			
		}
		
		
		public function connect():void{

			
				sqlConn = new SQLConnection();
				
				
				sqlConn.addEventListener(SQLEvent.OPEN, openAsyncHandler);
				sqlConn.addEventListener(SQLErrorEvent.ERROR, errorAsyncHandler);
				sqlConn.openAsync(dbFile);
			
			//con.sqlConnection = sqlConn;
		}
		
		
		private function onOpen():void{
			dispatchEvent( new Event( OPEN ) );}
		
		private function onClose():void{
			dispatchEvent( new Event( CLOSE ) );}
		
		private function onError( ):void{
			dispatchEvent( new Event( ERROR ) );
		}

		public function disconnect():void{
			sqlConn.close();
		    onClose();
		}
			
		
		private function openAsyncHandler(event:SQLEvent):void
		{
		
			if(sqlConn){
				
				onOpen();
			}
				
			else{
				onError();
			}
		}
		
		
		private function errorAsyncHandler(event:SQLErrorEvent):void
		{
			onError();
			/*if(counter < 10){
				
				retryConn();
				counter++;
			}*/
			
		}
		public function processSQL(sql:String):Array
		{
			try
			{		
				sqlStatement = new SQLStatement();
				sqlStatement.sqlConnection = sqlConn;
				sqlStatement.text = sql;//"SELECT * FROM stops ORDER BY stop_lat DESC";
				sqlStatement.execute();
				
				var r:Array = sqlStatement.getResult().data;
				if (r)
					return r;
			}
			catch (sqlError:SQLError)
			{
				trace("SQLError: " + sqlError.details);
			}
			catch (error:Error)
			{
				trace("error: " + error.message);		
			}
			return r;
		}
		//////////////////// getAccomodation///////////////////////////////////
		public function getAccomodation(conn:SQLConnection):void{
			
			country =  country.toLowerCase(); //country = type.toLocaleLowerCase(); // 
			//trace("country = " + country + " and " + "SELECT * FROM accomodation WHERE country LIKE '"+LIKE+country+LIKE+"'");
			var getStuff:SQLStatement = new SQLStatement();
			getStuff.sqlConnection = conn;
			var sql:String = "SELECT * FROM accomodation WHERE country LIKE '"+LIKE+country+LIKE+"'";
			getStuff.itemClass = AccomodationVO;
			getStuff.text = sql;
			getStuff.addEventListener(SQLEvent.RESULT, getAccomodationResult);
			getStuff.execute();
		}
		
		
		
		private function getAccomodationResult(e:SQLEvent):void {
			
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, getAccomodationResult);
			
			
			var result:SQLResult = stmt.getResult();	
			//var data:Vector.<AccomodationVO> = new Vector.<AccomodationVO>();
			var data:ArrayCollection = new ArrayCollection();
			var eve:ServiceEvent = new ServiceEvent(ServiceEvent.CATEGORIES_SUCCESS);
			
			if(result.data!=null){
			
				if(result.data.length > 1){
					
					
					for(var i:int = 0; i < result.data.length; i++){
						
						//data.push(result.data[i]);
						var ao:AccomodationVO = new AccomodationVO();
						ao = result.data[i];
						data.addItem(ao);//result.data[i]);
						eve.category = ACCOMODATION;
						}
					
				}
				else{
					
					data.addItem(result.data[0]);
					eve.category = ACCOMODATION;
				}
			
			}
			else{
				
				eve.category = NULL;
			}
			
			eve.accomodationData = data;
			Dispatcher.dispatch(eve);
		
	//	trace(data.length + data[0].description);
		}
		
		//////////////////// getReserves ////////////////////////////////////
		
		public function getReserves(conn:SQLConnection):void{
			
			sqlConn = conn;
			country = country.toLocaleLowerCase(); // trace("country = " + country + " " + type);
			var getStuff:SQLStatement = new SQLStatement();
			getStuff.sqlConnection = conn;
			var sql:String = "SELECT title, description, link, satellite FROM reserves WHERE country LIKE '"+LIKE+country+LIKE+"'";
			getStuff.itemClass = ReserveVO;
			getStuff.text = sql;
			getStuff.addEventListener(SQLEvent.RESULT, getReservesResult);
			getStuff.execute();
		}
		
		private function getReservesResult(e:SQLEvent):void {
			
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, getReservesResult);
			
			var eve:ServiceEvent = new ServiceEvent(ServiceEvent.CATEGORIES_SUCCESS);
			
			var result:SQLResult = stmt.getResult();	
			var data:ArrayCollection = new ArrayCollection();
			
			if(result.data!=null){
				
				if(result.data.length > 1){
					
					
					for(var i:int = 0; i < result.data.length; i++){
						
						//reserveData.push(result.data[i]);
						data.addItem(result.data[i]);
						eve.category = RESERVES;
					}
				}
				else{
					
					data.addItem(result.data[0]);
					eve.category = RESERVES;
				}
			}
			else{
				eve.category = NULL;
			}
			
			eve.reserveData = data;
			Dispatcher.dispatch(eve);
		}
		
		
		
		//////////////////// get Observatories ////////////////////////////////////
		
		public function getObservatories(conn:SQLConnection):void{
			
			country = country.toLowerCase(); // trace("country = " + country + " " + type);
			var getStuff:SQLStatement = new SQLStatement();
			getStuff.sqlConnection = conn;
			var sql:String = "SELECT * FROM observatories WHERE country LIKE '"+LIKE+country+LIKE+"'";
			getStuff.itemClass = ObservatoryVO;
			getStuff.text = sql;
			getStuff.addEventListener(SQLEvent.RESULT, getObservatoryResult);
			getStuff.execute();
		}
		
		private function getObservatoryResult(e:SQLEvent):void {
			
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, getFestivalResult);
			
			var eve:ServiceEvent = new ServiceEvent(ServiceEvent.CATEGORIES_SUCCESS);
			
			//observatoryData = new Vector.<ObservatoryVO>();
			var data:ArrayCollection = new ArrayCollection();
			var result:SQLResult = stmt.getResult();	
			
			if(result.data!=null){
				
				if(result.data.length > 1){
					
					
					for(var i:int = 0; i < result.data.length; i++){
						
						//observatoryData.push(result.data[i]);
						data.addItem(result.data[i]);
						eve.category = OBSERVATORIES;
					}
				}
				else{
					
					//observatoryData[0] = result.data[0];
					data.addItem(result.data[0]);
					eve.category = OBSERVATORIES;
				}
			}
			else{
				//observatoryData = new Vector.<ObservatoryVO>();
				eve.category = NULL;
			}
	
			
			
			//eve.observatories = observatoryData;
			eve.observatoriesData = data;
			Dispatcher.dispatch(eve);
		}
		
		
		//////////////////// get Museums////////////////////////////////////
		
		public function getMuseums(conn:SQLConnection):void{
			
			country = country.toLowerCase(); 
			var getStuff:SQLStatement = new SQLStatement();
			getStuff.sqlConnection = conn;
			var sql:String = "SELECT * FROM museums WHERE country LIKE '"+LIKE+country+LIKE+"'";
			getStuff.itemClass = MuseumVO;
			getStuff.text = sql;
			getStuff.addEventListener(SQLEvent.RESULT, getMuseumResult);
			getStuff.execute();
		}
		
		private function getMuseumResult(e:SQLEvent):void {
			
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, getMuseumResult);
			
			var eve:ServiceEvent = new ServiceEvent(ServiceEvent.CATEGORIES_SUCCESS);
			//museumData = new Vector.<MuseumVO>();
			var data:ArrayCollection = new ArrayCollection();
			
			var result:SQLResult = stmt.getResult();	
			
			if(result.data!=null){
				
				if(result.data.length > 1){
					
					
					for(var i:int = 0; i < result.data.length; i++){
						
						//museumData.push(result.data[i]);
						data.addItem(result.data[i]);
						eve.category = MUSEUMS;
					}
				}
				else{
					
					//museumData[0] = result.data[0];
					data.addItem(result.data[0]);
					eve.category = MUSEUMS;
				}
			}
			else{
				//museumData=new Vector.<MuseumVO>();
				eve.category = NULL;
			}
			
			
			//eve.museums =  museumData;
			eve.museumData = data;
			Dispatcher.dispatch(eve);
		}
		
		//////////////////// get Tours////////////////////////////////////
		
		public function getTours(conn:SQLConnection):void{
			
			country = country.toLowerCase();  //trace("country = " + country + " " + "SELECT * FROM tours WHERE country LIKE '"+LIKE+country+LIKE+"'");
			var getStuff:SQLStatement = new SQLStatement();
			getStuff.sqlConnection = conn;
			var sql:String = "SELECT * FROM tours WHERE country LIKE '"+LIKE+country+LIKE+"'";
			getStuff.itemClass = TourVO;
			getStuff.text = sql;
			getStuff.addEventListener(SQLEvent.RESULT, getTourResult);
			getStuff.execute();
		}
		
		private function getTourResult(e:SQLEvent):void {
			
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, getTourResult);
			var eve:ServiceEvent = new ServiceEvent(ServiceEvent.CATEGORIES_SUCCESS);
		
			var result:SQLResult = stmt.getResult();	
			//var data:Vector.<TourVO> = new Vector.<TourVO>();
			var data:ArrayCollection = new ArrayCollection();
			if(result.data!=null){
				
				if(result.data.length > 1){
					
					
					for(var i:int = 0; i < result.data.length; i++){
						
					//	data.push(result.data[i]);
						data.addItem(result.data[i]);
						eve.category = TOURS;
					}
				}
				else{
					
					data.addItem(result.data[0]);
					eve.category = TOURS;
				}
			}
			else{
				//data =new Vector.<TourVO>();
				eve.category = NULL;
			}
			
			
			eve.tourData = data;
			Dispatcher.dispatch(eve);
		}
		
		//////////////////// get general information////////////////////////////////////
		
		public function getInformation(conn:SQLConnection):void{
			
			country = country.toLowerCase(); // trace("country = " + country + " " + type);
			var getStuff:SQLStatement = new SQLStatement();
			getStuff.sqlConnection = conn;
			var sql:String = "SELECT * FROM information WHERE country LIKE '"+LIKE+country+LIKE+"'";
			getStuff.itemClass = InformationVO;
			getStuff.text = sql;
			getStuff.addEventListener(SQLEvent.RESULT, getInformationResult);
			getStuff.execute();
		}
		
		private function getInformationResult(e:SQLEvent):void {
			
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, getTourResult);
			
			
			var result:SQLResult = stmt.getResult();	
			var data:Vector.<InformationVO> = new Vector.<InformationVO>();
			if(result.data!=null){
				
				if(result.data.length > 1){
					
					
					for(var i:int = 0; i < result.data.length; i++){
						
						data.push(result.data[i]);
						
					}
				}
				else{
					
					data[0] = result.data[0];
				}
			}
			else{
				data =new Vector.<InformationVO>();
			}
			
			trace(data.length + " " + data[0].link);
		}
		
		//////////////////// getMailingList////////////////////////////////////
		
		public function getMList(conn:SQLConnection):void{
			
			country = country.toLowerCase(); // trace("country = " + country + " " + type);
			var getStuff:SQLStatement = new SQLStatement();
			getStuff.sqlConnection = conn;
			var sql:String = "SELECT * FROM mailing_lists WHERE country LIKE '"+LIKE+country+LIKE+"'";
			getStuff.itemClass = MailingListVO;
			getStuff.text = sql;
			getStuff.addEventListener(SQLEvent.RESULT, getMListsResult);
			getStuff.execute();
		}
		
		private function getMListsResult(e:SQLEvent):void {
			
			var stmt = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, getFestivalResult);
			var eve:ServiceEvent = new ServiceEvent(ServiceEvent.CATEGORIES_SUCCESS);
		//	mailListData = new Vector.<MailingListVO> ();
			var data:ArrayCollection = new ArrayCollection();
			
			var result:SQLResult = stmt.getResult();	
			
			if(result.data!=null){
				
				if(result.data.length > 1){
					
					
					for(var i:int = 0; i < result.data.length; i++){
						
					//	mailListData.push(result.data[i]);
						data.addItem(result.data[i]);	
						eve.category = MAILING_LIST;
					}
				}
				else{
					
					//mailListData[0] = result.data[0];
					data.addItem(result.data[0]);
					eve.category = MAILING_LIST;
				}
			}
			else{
				//mailListData =new Vector.<MailingListVO>();
				eve.category = NULL;
			}
			eve.category = MAILING_LIST;
			//eve.mailing_list = mailListData;
			eve.mailingData = data;
			Dispatcher.dispatch(eve);
			
			var last:ServiceEvent = new ServiceEvent(ServiceEvent.LAST_RESULT);
			Dispatcher.dispatch(last);
		}
		
		//////////////////// getFestivals ////////////////////////////////////
		
		public function getFestivals(conn:SQLConnection):void{
			
			country =  country.toLowerCase(); // trace("country = " + country + " " + type);
			var getStuff:SQLStatement = new SQLStatement();
			getStuff.sqlConnection = conn;
			var sql:String = "SELECT * FROM festivals WHERE country LIKE '"+LIKE+country+LIKE+"'";
			getStuff.itemClass = FestivalVO;
			getStuff.text = sql;
			getStuff.addEventListener(SQLEvent.RESULT, getFestivalResult);
			getStuff.execute();
		}
		
		private function getFestivalResult(e:SQLEvent):void {
			
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, getFestivalResult);
			
			var eve:ServiceEvent = new ServiceEvent(ServiceEvent.CATEGORIES_SUCCESS);
			var result:SQLResult = stmt.getResult();	
			//var festivalData:Vector.<FestivalVO> = new Vector.<FestivalVO>();
			var data:ArrayCollection = new ArrayCollection();
			
			if(result.data!=null){
				
				if(result.data.length > 1){
					
					
					for(var i:int = 0; i < result.data.length; i++){
						
						//festivalData.push(result.data[i]);
						data.addItem(result.data[i]);
					   eve.category = FESTIVAL;
					}
				}
				else{
					
					//festivalData[0] = result.data[0];
					data.addItem(result.data[0]);
					eve.category = FESTIVAL;
				}
			}
			else{
				//festivalData =new Vector.<FestivalVO>;
				eve.category = NULL;
			}
			
			
			
			//if(festivalData.length > 0){
				if(data.length > 0){
				eve.hasFestivals = true;
				//eve.festivals = festivalData;
				eve.festivalData = data;
				
			}
				
			else{
				
				eve.hasFestivals = false;
			}
			
			Dispatcher.dispatch(eve);
			
		}
		
		
		
		
		
		private function makeVisitData():void{
			
			trace("make that visit");
		}
		
		/////////////////// end//////////////////
	}
}