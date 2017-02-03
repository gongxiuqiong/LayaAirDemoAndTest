package test.watch
{
	import laya.debug.tools.Watcher;
	import laya.events.Event;

	public class WatchTest
	{
		private var vo:WatchVo;
		
		public function WatchTest()
		{
			vo = new WatchVo();
			vo.name = "hello";
			vo.recordCount = 0;
			
			Watcher.watch(vo, "recordCount", [watchFun]);
			
			Laya.stage.on(Event.CLICK, this, clickStage);
		}
		
		private function clickStage():void
		{
			vo.recordCount += 1;
		}		
		
		
		private function watchFun(arg:*):void
		{
			trace(":::::::::::",arg);
		}
	}
}