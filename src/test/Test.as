package test
{
	import laya.ui.ProgressBar;
	import laya.utils.Handler;
	
	public class Test
	{
		private var progressBar:ProgressBar;
		
		public function Test()
		{
			Laya.loader.load(["res/ui/progress.png", "res/ui/progress$bar.png"], Handler.create(this, onLoaded));
		}
		
		private function onLoaded():void
		{
			progressBar = new ProgressBar("res/ui/progress.png");
			Laya.stage.addChild(progressBar);
			progressBar.value = 0.1;
			
			Laya.timer.loop(30, this, fd);
		}
		
		private function fd():void
		{
			progressBar.value = (progressBar.value + 0.01) % 1;
		}
	}
}