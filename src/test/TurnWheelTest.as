package test
{
	import laya.display.Input;
	import laya.display.Text;
	import laya.events.Event;
	import laya.ui.Image;
	import laya.utils.Browser;
	import laya.utils.Ease;
	import laya.utils.TimeLine;
	import laya.utils.Tween;

	public class TurnWheelTest
	{
		private var wheel:Image = new Image("res/img_turntable.png");
		private var wheel2:Image = new Image("res/img_turntable.png");
		private const duration:int = 5000;
		private const turnNum:int = 4;
		private var tween:Tween;
		private var timeTxt:Input;
		private var turnNumTxt:Input;
		
		public function TurnWheelTest()
		{
			Laya.stage.addChild(wheel2);
			wheel2.pivot(185, 185);
			wheel2.pos(750, 250);
			Laya.stage.addChild(wheel);
			wheel.pivot(185, 185);
			wheel.pos(300, 250);
			
			timeTxt = new Input();
			timeTxt.text = duration.toString();
			timeTxt.fontSize = 20;
			timeTxt.color = "#ffffff";	
			Laya.stage.addChild(timeTxt);
			timeTxt.pos(1100, 50);
			
			turnNumTxt = new Input();
			turnNumTxt.text = turnNum.toString();
			turnNumTxt.fontSize = 20;
			turnNumTxt.color = "#ffffff";
			Laya.stage.addChild(turnNumTxt);
			turnNumTxt.pos(1100, 100);
			
			initBtns();
		}
		
		private var btnArr:Array = [];

		private var tween2:Tween;
		private function initBtns():void
		{
			creatBtn('sineInOut');
			creatBtn('QuadInOut');
			creatBtn('cubicInOut');
			creatBtn('quartInOut');
			creatBtn('quintInOut');
			
			creatBtn('expoInOut');
			creatBtn('strongInOut');
			
			for(var i:int = 0; i < btnArr.length; i++)
			{
				btnArr[i].y = i*23;
			}
		}
		
		private function creatBtn(easeStr:String):void
		{
			var txt:Text = new Text();
			txt.color = "#ffffff";
			txt.text = easeStr;
			Laya.stage.addChild(txt);
			btnArr.push(txt);
			txt.on(Event.CLICK, this, onClickBtn);
		}
		
		private var timeLine1:TimeLine;
		private var timeLine2:TimeLine;
		private function onClickBtn(e:Event):void
		{
			var easeStr:String = (e.target as Text).text;
			wheel.rotation = 0;
			wheel2.rotation = 0;
			
			var turnTime:int = parseInt(timeTxt.text);
			var wheelRotation:int = parseInt(turnNumTxt.text) * 360 + 120;
//			tween = Tween.to(wheel, { rotation:wheelRotation }, turnTime, Ease[easeStr]);
//			tween = Tween.to(wheel, { rotation:wheelRotation }, turnTime, SelfEase[easeStr]);
//			return;
//			Tween.to(wheel, { rotation:wheelRotation }, turnTime, Ease.cubicInOut);
//			var tween:Tween = Tween.to(wheel, { rotation:wheelRotation }, turnTime);
			
//			timeLine1 = TimeLine.to(wheel, { rotation:wheelRotation }, turnTime, Ease.cubicInOut);
//			timeLine1.play();
			
			wheel.visible = true;
			Tween.to(wheel, { rotation:wheelRotation }, turnTime, Ease.cubicInOut);
			Tween.to(wheel2, { rotation:wheelRotation }, turnTime, Ease.strongInOut);
//			Laya.timer.once(turnTime/2, this, fd);
		}
		
		private function fd():void
		{
			trace("----------------");
			wheel.visible = false;
			
//			Laya.timer.callLater(this, ff);
			
		}
		
		private function ff():void
		{
			var turnTime:int = parseInt(timeTxt.text);
			var wheelRotation:int = parseInt(turnNumTxt.text) * 360 + 120;
			timeLine2 = TimeLine.to(wheel, { rotation:wheelRotation/2 }, turnTime/2, Ease.strongOut);
			timeLine2.play();
		}
	}
}


import laya.ui.Box;
import laya.ui.Label;
class ListItemRender extends Box
{
	private var label:Label;
	
	public function ListItemRender()
	{
		size(100, 20);
		
		label = new Label();
		label.fontSize = 12;
		label.color = "#FFFFFF";
		addChild(label);
	}
	
	public function setLabel(value:String):void
	{
		label.text = value;
	}
}