package test.htmlAniTest
{
	import laya.net.Loader;
	import laya.ui.Panel;
	import laya.utils.ClassUtils;
	import laya.utils.Handler;
	
	import test.htmlAniTest.htmlAni.HTMLDivElement_new;

	public class HtmlAniTest
	{
		private var container:Panel;
		
		public function HtmlAniTest()
		{
			ClassUtils.regClass("ani", "test.htmlAniTest.htmlAni.HTMLAniElement");
			
			container = new Panel();
			container.size(1000,600);
			container.x = 200;
			Laya.stage.addChild(container);
			
			Laya.loader.load([{url:"res/swf/dadeng.swf", type:Loader.BUFFER},
				{url:"res/swf/image.png", type:Loader.IMAGE},
				{url:"res/swf/dadeng.json", type:Loader.ATLAS}
			], Handler.create(this, onLoaded));
		}
		
		private function onLoaded():void
		{
			var html:String = "<ani src='res/swf/dadeng.json'></ani>";
			html += "<img src='res/logo.png'></img>";
			html += "<span style='color:#FFFFFF;font-weight:bold'>HTMLDivElement</span>";
			html += "<span color='#6ad2e3'>创建的</span><br/>";
			html += "<span color='#d26ae3'>HTML文本</span>";
			var div:HTMLDivElement_new = new HTMLDivElement_new();
			div.innerHTML = html;
			div.pos(0,0);
			container.addChild(div);
		}
	}
}