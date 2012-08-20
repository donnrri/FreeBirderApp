package fb.utils
{
	public class StringUtils
	{
		public static const CONTINENT_VIEW:String = "continent";
		public static const COUNTRY_VIEW:String = "country";
		public static var DATABASE_NAME:String = "app.db";
		public static const FRAME_RATE:uint = 12;
		
		public static const COUNTRY_ITEM_HEIGHT:uint = 50;
		
		public static var tripArray:Array = new Array({ label: "Places to Stay", icon:"assets/dpi160/icons/home.png"}, 
			                                          { label:"Places to Visit", icon:"assets/dpi160/icons/23-bird.png"},
													  { label: "Tours and Guides", icon:"assets/dpi160/icons/102-walk.png"},
	  													{ label: "People to Meet", icon:"assets/dpi160/icons/handshake_small.png"});
		
		public static var tripAndFestivalArray:Array = new Array({ label: "Places to Stay", icon:"assets/dpi160/icons/home.png"}, 
																{ label:"Places to Visit", icon:"assets/dpi160/icons/23-bird.png"},
																{ label: "Tours and Guides", icon:"assets/dpi160/icons/102-walk.png"},
																{ label: "People to Meet", icon:"assets/dpi160/icons/handshake_small.png"},
																{ label: "Events", icon:"assets/dpi160/icons/smile_small_small.png"});
		
		private static const GET_TOURS:String = "Tours and Guides";
		private static const GET_ACCOMODATION:String = "Places to Stay";
		private static const GET_OBSERVE:String = "Observatories";
		private static const GET_RESERVE:String = "Reserves";
		private static const GET_FESTIVAL:String = "get festival";
		private static const GET_MAILING_LIST:String = "Mailing List";
		private static const ERROR:String = "ERROR";
		private static const GET_MUSEUMS:String = "museum";
		
		
		public static var commandVector:Vector.<String> = Vector.<String>(
			[
				GET_ACCOMODATION,
				GET_TOURS,
				GET_OBSERVE,
				GET_RESERVE,
				GET_MUSEUMS,
				GET_FESTIVAL,
				GET_MAILING_LIST
			]
		);
		
		}
	}