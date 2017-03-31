package test
{
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.utils.Dictionary;
	
	/**
	 * (鼠标指上)悬浮提示 
	 */
	public class MouseTip extends Sprite
	{	
		/** 显示的延迟时间 */
		private const _timerDelay:int = 500;
		
		/** 显示悬浮提示的元件 */
		private var _ownerObject:Sprite;
		/** 显示的文字信息 */
		private var _showString:String;
		
		private var mouseTipView:MouseTipUI;
		
		private var dic:Dictionary = new Dictionary();
		
		private static var instance:MouseTip;
		
		public function MouseTip()
		{
			super();
		}
		
		public static function getInstance():MouseTip
		{
			if(instance == null)
				instance = new MouseTip();
			return instance;
		}
		
		/**
		 * 初始设置。
		 * @param __ownerObject：需要悬浮提示的元件
		 * @param __showString：悬浮提示显示的字符串
		 * @param __bgUrl：背景图像链接地址
		 */
		public function setTip(__ownerObject:Sprite,__showString:String):void
		{
			_ownerObject = __ownerObject;
			_showString = __showString;
			this.dic.set(_ownerObject, _showString);
			_ownerObject.on(Event.MOUSE_OVER, this, onMouseOver);
			_ownerObject.on(Event.MOUSE_MOVE, this, onMouseMove);
			_ownerObject.on(Event.MOUSE_OUT,this, onMouseOut);
			_ownerObject.once(Event.REMOVED, this, onRemoved);
		}
		/**
		 * 当元件移除舞台，移除监听 
		 * @param e
		 * 
		 */
		private function onRemoved():void
		{
			_ownerObject.off(Event.MOUSE_OVER, this, onMouseOver);
			_ownerObject.off(Event.MOUSE_MOVE, this, onMouseMove);
			_ownerObject.off(Event.MOUSE_OUT, this, onMouseOut);
		}
		
		private function onMouseOver(e:Event):void
		{
			onMouseMove(e);
		}
		
		/**
		 * 鼠标移动时
		 * @param e
		 * 显示bg,设置文本显示
		 */
		private function onMouseMove(e:Event):void
		{
			if(this.mouseTipView == null)
			{
				if(_timerDelay > 0)
				{
					timer.once(_timerDelay, this, show, [e.target]);
				}
				else if(_timerDelay == 0)
				{
					show(e.target);
				}
			}
			else
			{
				show(e.target);
			}
		}
		
		private function show($key:*):void
		{
			if(this.mouseTipView == null)
			{
				this.mouseTipView = new MouseTipUI();
				Laya.stage.addChild(this.mouseTipView);
				
				this.mouseTipView.txt.text = dic.get($key);
				this.mouseTipView.txt.width = this.mouseTipView.txt.textWidth;
				this.mouseTipView.bg.width = this.mouseTipView.txt.width + 15;
				this.mouseTipView.bg.height = this.mouseTipView.txt.height + 8;
			}
			var xNum:Number = mouseX + 10;
			this.mouseTipView.x = xNum;
			this.mouseTipView.y = mouseY;
		}
		
		/** 鼠标移开 */
		private function onMouseOut():void
		{
			timer.clear(this, show);
			if(this.mouseTipView)
			{
				this.mouseTipView.removeSelf();
				this.mouseTipView = null;
			}
		}
	}
}