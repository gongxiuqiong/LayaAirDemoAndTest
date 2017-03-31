package test
{
	import laya.events.Event;
	import laya.utils.Mouse;

	public class MouseTest
	{
		public function MouseTest()
		{
			Laya.stage.on(Event.CLICK, this, clickStage);
		}
		
		
		private var count:int = 0;
		private function clickStage():void
		{
			count++;
			if(count % 4 == 1)
			{
				Mouse.cursor = "hand";
			}
			else if(count % 4 == 2)
			{
				Mouse.cursor = "move";
			}
			else if(count % 4 == 3)
			{
				Mouse.cursor = "wait";
			}
			else if(count % 4 == 0)
			{
				Mouse.cursor = "auto";
			}
			
		}
	}
}