package view
{
	import laya.events.Event;
	
	import ui.test.RuntimeTestUI;

	public class RunTimeTestView extends RuntimeTestUI
	{
		public function RunTimeTestView()
		{
			txt.on(Event.CLICK, this, fd);
		}
		
		private var count:int = 1;
		private function fd():void
		{
			txt.text = count.toString();
			count ++;
		}
	}
}