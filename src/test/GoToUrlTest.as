package test
{
	import laya.events.Event;
	import laya.utils.Browser;

	public class GoToUrlTest
	{
		public function GoToUrlTest()
		{
			Laya.stage.on(Event.CLICK, this, clickStage);
		}
		
		private function clickStage():void
		{
			Browser.window.location.href="http://www.baidu.com"; 
		}
	}
}