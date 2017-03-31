package layaAirSamples
{
	import laya.display.Stage;
	import laya.events.Event;
	import laya.map.TiledMap;
	import laya.maths.Rectangle;
	import laya.utils.Browser;
	import laya.utils.Handler;
	import laya.utils.Stat;

	public class TiledMap_ScrollMap
	{

		private var tiledMap:TiledMap;
		private var mLastMouseX:Number = 0;
		private var mLastMouseY:Number = 0;

		private var mX:Number = 0;
		private var mY:Number = 0;

		public function TiledMap_ScrollMap()
		{
			Laya.init(Browser.width, Browser.height);
			Stat.show(10, 10);
			Laya.stage.scaleMode = Stage.SCALE_FULL;
			createMap();
			Laya.stage.on(Event.MOUSE_DOWN, this, this.mouseDown);//注册鼠标事件
			Laya.stage.on(Event.MOUSE_UP, this, this.mouseUp);
		}

		//创建地图
		private function createMap()
		{
			//创建地图对象
			tiledMap = new TiledMap();

			mX = mY = 0;
			//创建地图，适当的时候调用destory销毁地图
			tiledMap.createMap("res/tiledMap/desert.json", new Rectangle(0, 0, Browser.width, Browser.height), new Handler(this, completeHandler));
		}

		/**
		 * 地图加载完成的回调
		 */
		private function completeHandler():void
		{
			trace("地图创建完成");
			trace("ClientW:" + Browser.clientWidth + " ClientH:" + Browser.clientHeight);
			Laya.stage.on(Event.RESIZE, this, this.resize);
			resize();
		}

		//鼠标按下拖动地图
		private function mouseDown():void
		{
			mLastMouseX = Laya.stage.mouseX;
			mLastMouseY = Laya.stage.mouseY;
			Laya.stage.on(Event.MOUSE_MOVE, this, this.mouseMove);
		}

		private function mouseMove():void
		{
			//移动地图视口
			tiledMap.moveViewPort(mX - (Laya.stage.mouseX - mLastMouseX), mY - (Laya.stage.mouseY - mLastMouseY));
		}

		private function mouseUp():void
		{
			mX = mX - (Laya.stage.mouseX - mLastMouseX);
			mY = mY - (Laya.stage.mouseY - mLastMouseY);
			Laya.stage.off(Event.MOUSE_MOVE, this, this.mouseMove);
		}

		 // 窗口大小改变，把地图的视口区域重设下
		private function resize():void
		{
			//改变地图视口大小
			tiledMap.changeViewPort(mX, mY, Browser.width, Browser.height);
		}
	}
}
