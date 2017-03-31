package test
{
	import laya.ani.swf.MovieClip;
	import laya.net.Loader;
	import laya.utils.Handler;

	public class McTest
	{
		public function McTest()
		{
			Laya.loader.load([{url:"res/swf/dadeng.swf", type:Loader.BUFFER},
				{url:"res/swf/image.png", type:Loader.IMAGE},
				{url:"res/swf/dadeng.json", type:Loader.ATLAS}
			], Handler.create(this, onLoaded));
//			onLoaded();
		}
		
		private var mc:MovieClip;
		private function onLoaded():void
		{
			trace("----------");
			mc = new MovieClip();
			mc.load("res/swf/dadeng.swf", true);
			Laya.stage.addChild(mc);
			
			mc.gotoAndStop(20);
		}
	}
}