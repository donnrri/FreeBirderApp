package com.purplemedia.components.date
{
	import com.purplemedia.components.date.DateField;
	import com.purplemedia.components.date.iconSprite;
	
	import flash.display.Bitmap;
	import flash.display.BlendMode;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.ContextMenu;
	
	import spark.components.SkinnableContainer;
	import spark.core.SpriteVisualElement;

	/**
	 * ...
	 * @author Nidin Vinayak
	 */
	public class UIProperties extends SkinnableContainer
	{
		[Embed(source = "./asset/icon.png")]
			private var icon:Class;
		
		public var isHidden				:Boolean;
		public var calendarIcon			:iconSprite;		
		public var dateField			:DateField;
		public var myMenu			 	:ContextMenu;
		public var oldHit		 		:* = undefined;	
		public var font					:String = "Tahoma";		
		public var embedFonts			:Boolean = false;
		public var letterSpacing		:Number = 32;//13
		public var MonthAndYearFontSize	:Number = 14;
		public var WeekNameFontSize		:Number = 16;
		public var DayFontSize			:Number = 14;
		
		protected var Calendar			:SpriteVisualElement;
		protected var _dateformat		:String = "D/M/Y";
		protected var _icon				:Bitmap;
		protected var inited			:Boolean	=	false;
		protected var isHitted			:Object;
		protected var cellArray			:Array;
		protected var isToday			:Boolean	=	false;
		protected var Days				:Array;
		protected var Months			:Array;
		protected var DaysinMonth		:Array;
		protected var prevDate			:Number;
		protected var today				:Date;
		protected var todaysday			:Number;
		protected var currentyear		:Number;
		protected var currentmonth		:Number;
		protected var currentDateLabel	:TextField;
		protected var internalDate		:String;
		protected var day_bg			:MovieClip;
		protected var hit				:Sprite;
		protected var day_txt			:TextField;
		protected var _startDay			:String = "sunday";
		protected var _startID			:int = 1;

		/*
		 * COLOR VARIABLES
		 */		
		protected var backgroundColor			:Array	=	[0x12D8E4, 0x003f48]; //24B1C9];
		protected var backgroundStrokeColor		:int	=	0x003f48;//0xA9A9C2;
		protected var labelColor				:int	=	0xFFFFFF;
		protected var buttonColor				:int	=	0xffffff;
		protected var DesabledCellColor			:int	=	0xE5E5E5;
		protected var EnabledCellColor			:int	=	0xFFFFFF;
		protected var TodayCellColor			:int	=	0xee9310;//E20012;
		protected var mouseOverCellColor		:int	=	0xb6f9ad;//0099FF;
		protected var entryTextColor			:int	=	0x000000;

		/*
		 *	CALENDAR DIAMENSIONS VARIABLES		 
		 */		
		protected var calendarWidth			:Number		= 370;//165
		protected var calendarHeight		:Number		= 356;//178;
		protected var cellWidth				:Number		= 42;//21;
		protected var cellHeight			:Number		= 40;//20;
		protected var labelWidth			:Number		= 16;//8;
		
		public function UIProperties() 
		{
			_icon = new icon();
		}
		
	}

}