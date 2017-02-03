package test
{
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.events.Event;
	
	public class SkTest
	{
		private var face:Skeleton;
		private var xiaodeng:Skeleton;
		private var qingtouzhu:Skeleton;
		
		public function SkTest()
		{
			creatSk("res/CasionGirl.sk", face);
//			creatSk("res/xiaodeng.sk", xiaodeng);
//			creatSk("res/qingtouzhu.sk", qingtouzhu);
		}
		
		private var count_load:int = 0;
		private function creatSk($skUrl:String, $sk:Skeleton):void
		{
			count_load++;
			$skUrl = $skUrl + "?v=" +  Math.random() * 999999;
			var factory:Templet = new Templet();
			factory.once(Event.COMPLETE, this, parseComplete, [factory, $sk]);
			factory.once(Event.ERROR, this, onError);
			factory.loadAni($skUrl);
		}
		
		private var count_loaded:int = 0;
		private function parseComplete($factory:Templet, $sk:Skeleton):void 
		{
			count_loaded++;
			$sk = $factory.buildArmature();
			Laya.stage.addChild($sk);
			$sk.pos(1000, 400);
//			$sk.play(0, true);
//			$sk.play("stand", true);
			$sk.play("pullTheRocker", false);
			
			if(count_loaded == count_load)
			{
				onLoadAll();
			}
		}
		
		private function onError():void
		{
			trace("error");
		}
		
		private function onLoadAll():void
		{
//			face.pos(400, 400);
//			xiaodeng.pos(100, 100);
		}
	}
}