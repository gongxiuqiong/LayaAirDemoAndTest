package test.mouseTip
{
	import laya.ui.Image;

	public class MouseTipTest
	{
		public function MouseTipTest()
		{
			var img:Image = new Image("res/img/img_tonghuashun2.png");
			MouseTip.getInstance().set(img, "aaaa", "res/img/img_blankmoney.png");
			Laya.stage.addChild(img);
		}
	}
}