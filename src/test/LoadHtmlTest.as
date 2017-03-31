package test
{
	import laya.events.Event;
	import laya.net.HttpRequest;
	import laya.net.Loader;

	public class LoadHtmlTest
	{
		public function LoadHtmlTest()
		{
//			var loader:Loader = new Loader();
//			loader.load("http://localhost/NewLuckyBigWheel/", Loader.TEXT);
//			loader.load("http://10.50.200.123/NewLuckyBigWheel/", Loader.TEXT);
//			loader.on(Event.COMPLETE, this, onComplete);
			
			var http:HttpRequest = new HttpRequest();
			http.on(Event.PROGRESS, this, onProgress);
			http.on(Event.ERROR, this, onError);
			http.on(Event.COMPLETE, this, onLoaded);
			http.send("http://10.50.200.123/NewLuckyBigWheel/", null, "get", "jsonp");
		}
		
		private function onComplete(data:*):void
		{
			trace(data);
		}
		
		/**@private */
		protected function onProgress(value:Number):void {
			trace("progress ",value);
		}
		
		/**@private */
		protected function onError(message:String):void {
			trace("error ", message);
		}
		
		/**
		 * 资源加载完成的处理函数。
		 * @param	data 数据。
		 */
		protected function onLoaded(data:* = null):void {
			trace("onLoaded:::", data);
		}
	}
}