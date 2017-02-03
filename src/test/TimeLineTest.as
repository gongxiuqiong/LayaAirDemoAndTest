package test
{
	import laya.ui.Image;
	import laya.utils.Ease;
	import laya.utils.TimeLine;

	public class TimeLineTest
	{
		private var img:Image;
		
		public function TimeLineTest()
		{
			img = new Image("logo.png");
			
			Laya.stage.addChild(img);
			var timeLine:TimeLine = TimeLine.to(img, {y:200}, 2000, Ease.circIn).to(img, {x:200}, 200, Ease.strongOut);
			timeLine.play();
		}
	}
}