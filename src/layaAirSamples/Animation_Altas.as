package layaAirSamples 
{
	import laya.display.Animation;
	import laya.display.Stage;
	import laya.net.Loader;
	import laya.utils.Browser;
	import laya.utils.Handler;
	
	public class Animation_Altas 
	{
		public function Animation_Altas() 
		{
			Laya.init(550, 400);
			Laya.stage.scaleMode = Stage.SCALE_SHOWALL;
			
			//创建一个动画对象
			var ani:Animation = new Animation();
			ani.loadAtlas("res/fighter/fighter.json");
			//设置位置  
			ani.pos(180, 90);
			//设置播放间隔（单位：毫秒）
			ani.interval = 30;
			//当前播放索引
			ani.index = 1;
			//播放图集动画
			ani.play();
			
			Laya.stage.addChild(ani);
		}
	}
}