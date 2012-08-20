package com.purplemedia.components.date
{
	import mx.core.IFactory;
	import com.purplemedia.components.date.DateField;
	import com.purplemedia.components.date.calendarSkin;
	import com.purplemedia.components.date.iconSprite;
	import com.purplemedia.events.calendarEvent;
	import com.purplemedia.lib.caurina.transitions.Tweener;
	
	import flash.display.DisplayObject;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.TitleWindow;
	import spark.core.SpriteVisualElement;
	
	
	public class DateChooser extends calendarSkin implements IFactory
	{
		private var _currentDate:String;
		
		
		
		public function get target():Object
		{
			return _target;
		}
		
		public function set target(value:Object):void
		{
			_target = value;
		}
		
		public function get yVal():Number
		{
			return _yVal;
		}
		
		public function set yVal(value:Number):void
		{
			_yVal = value;
		}
		
		public function get xVal():Number
		{
			return _xVal;
		}
		
		public function set xVal(value:Number):void
		{
			_xVal = value;
		}
		
		public function get selectedDate():String { return internalDate; }
		public function set dateFormat(f:String):void { _dateformat = f;}
		
		private var _calX:Number = 0;
		private var _calY:Number = 0;
		private var originalX:int;
		
		
		private var _xVal:Number;
		private var _yVal:Number;
		private var _target:Object;
		
		
		public final function DateChooser() {
			
			
			originalX = this.x;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_construct();
			update();
			
			/*this.graphics.beginFill(0xff0000);
			this.graphics.drawRect(0,0, this.width, this.height);
			this.graphics.endFill();*/
			
		}
		private function update():void {//e:calendarEvent
			
			isHidden		= true;
			//Calendar.x		= 0;
			//Calendar.y      = 0;//-120;
			
			showCalendar();
			addEventListener(MouseEvent.MOUSE_OVER,MouseOver);
			addEventListener(MouseEvent.MOUSE_OUT,MouseOut);
			addEventListener(MouseEvent.CLICK,MouseClick);
		}
		/*
		*	CONTEXT MENU 
		* 
		*/
		
		public function showCalendar():void{
			
			//addElement(Calendar);
			addElement(Calendar);
			
			//var pt:Point = new Point(this.xVal, this.yVal);
			///pt = this.target.localToGlobal(pt);
			
			this.x = 0;//this.width;//pt.x;
			this.y = 0;//pt.y ;
			//FlexGlobals.topLevelApplication.addElement(this);
			//addElement(this);
			Tweener.addTween(Calendar, { alpha:1, time:1, transition:"easeOutExpo" } );
			isHidden	=	false;
			
		}
		private function addCustomMenuItems():void {
			
			myMenu = new ContextMenu();
			myMenu.hideBuiltInItems();
			var menu1:ContextMenuItem;
			var menu2:ContextMenuItem;
			menu1 = null;
			menu1 = new ContextMenuItem("An iGi Lab Production");
			menu2 = new ContextMenuItem("Follow us");			
			menu1.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, navigateToSite);
			menu2.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, navigateToSite);
			myMenu.customItems.push(menu1);
			myMenu.customItems.push(menu2);
			this.contextMenu = myMenu;
			return;
		}	
		private function navigateToSite(e:ContextMenuEvent):void
		{
			navigateToURL(new URLRequest("http://www.infogroupindia.com/blog"), "_blank");
			return;
		}				
		//=======================================================================================================
		//							MOUSE EVENT LISTENERS
		//=======================================================================================================		
		private function showHideCalendar(e:MouseEvent):void {
			
			
			if (e.currentTarget == stage) {
				if(e.target.name == "hit" || e.target.name == "NextButton" || e.target.name == "PrevButton" ){				
					return;
				}
			}
			if (isHidden) {
				
				
				var pt:Point = new Point(e.localX, e.localY);
				pt = e.target.localToGlobal(pt);
				
				this.x = 0;//pt.x;
				this.y = 0;//pt.y ;  
				addElement(Calendar);
				//FlexGlobals.topLevelApplication.addElement(this);
				
				Tweener.addTween(Calendar, { alpha:1, time:1, transition:"easeOutExpo" } );
				isHidden	=	false;
				
				addEventListener(MouseEvent.CLICK,MouseClick);
				try{
					stage.addEventListener(MouseEvent.MOUSE_UP, showHideCalendar);
					
				}catch (e:Error) {}
			}else {
				/*calendarIcon.alpha = 0;
				Tweener.addTween(Calendar, { alpha:0, time:0.1, transition:"easeOutExpo",onComplete:function ():void{
				removeElement(Calendar); 
				Tweener.addTween(calendarIcon, {x:-10, y:-10, time:0.1, transition:"easeOutExpo",onComplete:function ():void{ calendarIcon.alpha = 1;} });*/
				//FlexGlobals.topLevelApplication.removeElement(this);
				removeElement(Calendar);
				//} } );  trace("NUMBER CHILDREN = " + String(this.numChildren));
				isHidden	=	true;
				//FlexGlobals.topLevelApplication.removeElement(this);
				//removeEventListener(MouseEvent.CLICK,MouseClick);
				
				try{
					stage.removeEventListener(MouseEvent.MOUSE_UP, showHideCalendar);
					
					
				}catch (e:Error) {}				
			}
		}
		private function MouseOver(e:MouseEvent):void {
			if(!isHidden){
				if(e.target.name == "hit"){
					if(!e.target.parent.hitted)
						changeColor(e.target.parent,mouseOverCellColor);
				}else{
					return;
				}
			}
		}
		private function MouseOut(e:MouseEvent):void {
			if(!isHidden){
				if(e.target.name == "hit"){
					if(!e.target.parent.hitted)
						changeColor(e.target.parent,e.target.parent.id);
				}else{
					return;
				}
			}
		}
		private function MouseClick(e:MouseEvent):void {
			
			
			if(!isHidden){
				if(e.target.name == "hit"){
					
					
					//	e.target.parent.hitted		=	true;
					//		isHitted.status 			=	true;
					//		isHitted.num				=	e.target.parent.serial;
					if(oldHit != undefined){
						cellArray[oldHit].hitted 	= 	false;
						changeColor(cellArray[oldHit],cellArray[oldHit].id);
					}
					oldHit			=	e.target.parent.serial;
					internalDate	=	formatDate(e.target.parent.date.getDate(), (currentmonth + 1) , currentyear);
					currentDate = internalDate;
					//dateField.text	=	internalDate;
					dispatchEvent(new calendarEvent(calendarEvent.CHANGE, internalDate)); 
					showHideCalendar(e);
					if(!e.target.parent.isToday){ changeColor(e.target.parent,mouseOverCellColor); }
				}else{
					return;
					
				}
			}
		}
		
		private function formatDate(day:Number,month:Number,year:Number):String {
			if (_dateformat == "D/M/Y") {
				return(day + "/" + month + "/" + year);
			}else if (_dateformat == "D/Y/M") {
				return(day + "/" + year + "/" + month);
			}else if (_dateformat == "M/D/Y") {
				return(month + "/" + day + "/" + year);
			}else if (_dateformat == "M/Y/D") {
				return( month + "/" + year + "/" + day );
			}else if (_dateformat == "Y/M/D") {
				return( year + "/" + month + "/" + day);
			}else if (_dateformat == "Y/D/M") {
				return( year + "/" + day + "/" + month);
			}else{
				return(day + "/" + month + "/" + year);
			}
		}
		
		public function get currentDate():String
		{
			return _currentDate;
		}
		
		public function set currentDate(value:String):void
		{
			_currentDate = value;
		}
		
		public function newInstance():*
		{
			return null;
		}
	}
}