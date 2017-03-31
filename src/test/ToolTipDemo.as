package test
{
	import laya.net.Loader;
	import laya.ui.Button;
	import laya.ui.TipManager;
	import laya.utils.Handler;
	
	public class ToolTipDemo
	{
		
		private var _tip:TipManager;//实例化TipManager
		public function ToolTipDemo()
		{
			Laya.stage.bgColor="#eeffcc";
			Laya.loader.load("res/atlas/comp.json",Handler.create(this,onLoaded),null,Loader.ATLAS);
		}
		
		private function onLoaded():void
		{
			
//			this._testTip=new TestTipsUI();//务必在Laya.init后去new实例,不可直接在全局变量处实例化
			//切记，无论何种鼠标提示方式，务必要先实例化TipManager，简单的鼠标提示可以直接new tipManager
			this._tip=new TipManager();//务必在Laya.init后去new实例，不可直接在全局变量处实例化
			//简单的鼠标提示
			var button:Button=new Button();
			Laya.stage.addChild(button);
			button.label="button One";
			button.pos(100,100);
			button.skin="comp/button.png";
			button.toolTip="我是button One!";
		}
	}
}