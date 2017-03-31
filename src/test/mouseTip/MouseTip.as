package test.mouseTip
{
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.events.Event;
	import laya.ui.Image;
	
	/**
	 * (鼠标指上)悬浮提示 
	 * @author Administrator
	 * 
	 * ey.
	 *  package base.tool.mouseTip
		{
			import base.resLoader.uiRes.UIResourceManager;
			
			import flash.display.Sprite;
			import flash.events.Event;
			
			public class Test extends Sprite
			{
				private var s:Sprite;
				
				public function Test()
				{
					super();
					this.addEventListener(Event.ADDED_TO_STAGE,onAdded);
				}
				private function onAdded(e:Event):void
				{
					UIResourceManager.getInstance().addEventListener("img/g0003.png",ok);
					UIResourceManager.getInstance().loadObj("img/g0003.png");
					
				}
				private function ok(e:Event):void
				{
					s = new Sprite();
					s.graphics.beginFill(0x00ff00);
					s.graphics.drawRect(100,100,500,500);
					s.graphics.endFill();
					MouseTip._stage = this.stage;
					var str:String = "<font color='#ff0000'>我勒个去</font>";
					
					MouseTip.getInstance().set(s,str,"img/g0003.png");
					addChild(s);
				}
			}
		}
	 * 
	 */
	public class MouseTip extends Sprite
	{	
		/** 显示悬浮提示的元件 */
		private var _ownerObject:Sprite;
		/** 显示的文字信息 */
		private var _showString:String;
		/** 背景图像链接地址 */
		private var _bgUrl:String;
		/** 文本框的宽度上限 */
		private var _txtWidth:int = 150;
		/** 显示的延迟时间 */
		private const _timerDelay:int = 1000;
		
		/** 悬浮提示背景 */
		private var _bg:Image;
		/** 悬浮提示显示文本的文本框 */
		private var _txt:Text;
		/** 是否绘制了bg */
		private var _drawBg:Boolean;
		
		private static var instance:MouseTip;
		
		public function MouseTip()
		{
			super();
			init();
		}
		public static function getInstance():MouseTip
		{
			if(instance == null)
				instance = new MouseTip();
			return instance;
		}
		private function init():void
		{
			initBg();
			initTxt();
		}
		private function initTxt():void
		{
			if(_txt == null)
			{
				_txt = new Text();
				_txt.color = "#ffffff";
				_txt.autoSize = "left";
				_txt.wordWrap = true;
				_bg.addChild(_txt);
				_txt.x = 4;
				_txt.y = 4;
			}
		}
		private function initBg():void
		{
			if(_bg == null)
			{
				_bg = new Image();
				Laya.stage.addChild(_bg);
				_bg.mouseEnabled = false;
//				_bg.mouseChildren = false;
			}
		}
		/**
		 * 初始设置。
		 * @param __ownerObject：需要悬浮提示的元件
		 * @param __showString：悬浮提示显示的字符串
		 * @param __bgUrl：背景图像链接地址
		 */
		public function set(__ownerObject:Sprite,__showString:String,__bgUrl:String=""):void
		{
			_ownerObject = __ownerObject;
			_showString = __showString;
			_bgUrl = __bgUrl;
			_ownerObject.on(Event.MOUSE_MOVE, this, onMouseMove);
			_ownerObject.on(Event.MOUSE_OUT,this, onMouseOut);
		}
		/**
		 * 当元件移除舞台，移除监听 
		 * @param e
		 * 
		 */
		private function onRemoved(e:Event):void
		{
			_ownerObject.off(Event.MOUSE_OVER, this, onMouseMove);
			_ownerObject.off(Event.MOUSE_OUT, this, onMouseOut);
		}
		private var delayed:Boolean;
		/**
		 * 鼠标移动时
		 * @param e
		 * 显示bg,设置文本显示
		 */
		private function onMouseMove(e:Event):void
		{
			if(_bg.visible == false && _timerDelay > 0 && _drawBg == false && delayed == false)
			{
//				_delayId = setTimeout(show,_timerDelay);
				timer.once(_timerDelay, this, show);
				delayed = true;
			}
			else if(_bg.visible == false &&  _timerDelay == 0)
			{
				show();
			}
			else if(_bg.visible)
			{
				show();
			}
		}
		
		private function show():void
		{
			if(_drawBg == false)
			{
				_txt.text = _showString;
				
				//如果没有设置背景图片的路径地址
				if(_bgUrl != "")
				{
					_bg.skin = _bgUrl;
					_bg.width = _txt.width + 8;
					_bg.height = _txt.height + 8;
				}
				_drawBg = true;
				_bg.visible = true;
			}
			_bg.x = mouseX;
			_bg.y = mouseY;
		}
		/** 鼠标移开 */
		private function onMouseOut(e:Event):void
		{
//			clearTimeout(_delayId);
			delayed = false;
			_drawBg = false;
			_bg.visible = false;
		}
	}
}