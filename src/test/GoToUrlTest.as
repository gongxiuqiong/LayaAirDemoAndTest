package test
{
	import laya.display.Text;
	import laya.events.Event;
	import laya.ui.Button;
	import laya.utils.Browser;

	public class GoToUrlTest
	{
		public function GoToUrlTest()
		{
			var url:String = "http://www.baidu.com";
//			var btn:Button = new Button();
//			btn.size(50, 100);
//			btn.label = url;
//			Laya.stage.addChild(btn);
//			btn.on(Event.CLICK, null, function ():void{Browser.window.open ('http://www.baidu.com ','newwindow','height=900,width=1280,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');});
			
			var txt:Text = new Text();
			txt.text = url;
			txt.size(txt.textWidth, txt.textHeight);
			Laya.stage.addChild(txt);
			txt.on(Event.CLICK, this, clickBtn);
		}
		
		private function clickBtn(e:Event):void
		{
//			var url:String = (e.target as Button).label;
//			trace("---------",url);
//			Browser.window.location.href="http://www.baidu.com"; 
//			Browser.window.open(url);
//			var tempwindow:* = Browser.window.open();
//			tempwindow.location=url;
			Browser.window.open ('http://www.baidu.com ','newwindow','height=500,width=800,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no') ;
		}
	}
}