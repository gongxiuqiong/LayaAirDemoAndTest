package test
{
	import laya.display.Sprite;

	public class RoundLoadingTest
	{
		private var loading:Sprite;
		
		private var a:int = 0;
		public function RoundLoadingTest()
		{
			loading = new Sprite();
			Laya.stage.addChild(loading);
			loading.pos(50,50);
			
//			Laya.timer.loop(1000, this, onTimer);
			Laya.timer.frameLoop(5, this, onTimer);
			loading.graphics.drawPie(0, 0, 50, 0, a, "#ffffff", "#ff00ff");
		}
		
		private function onTimer():void
		{
			a += 6;
			loading.graphics.drawPie(0, 0, 50, 0, a, "#ffffff", "#ff00ff");
			
			if(a == 360)
				Laya.timer.clear(this, onTimer);
		}
	}
}