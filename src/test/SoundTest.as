package test
{
	import laya.events.Event;
	import laya.media.SoundManager;
	import laya.ui.Image;
	import laya.ui.Label;
	import laya.utils.Ease;
	import laya.utils.Tween;

	public class SoundTest
	{
		private var img:Image;
		
		public function SoundTest()
		{
//			SoundManager.playSound("res/sound/wheelOfFortune.mp3");
			
			var label:Label = new Label("这是一个按钮哈");
			label.color = "#ffffff";
			label.pos(800, 50);
			label.on(Event.CLICK, this, turnWheel);
			Laya.stage.addChild(label);
			
			img = new Image("res/img_turntable.png");
			img.pivot(185, 185);
			Laya.stage.addChild(img);
			img.pos(200,200);
		}
		
		private function turnWheel():void
		{
			// TODO Auto Generated method stub
			this.img.rotation = 0;
			Tween.to(this.img, {rotation : 12*360}, 10000, Ease.strongInOut);
			SoundManager.playSound("res/sound/wheeling.mp3");
		}
	}
}