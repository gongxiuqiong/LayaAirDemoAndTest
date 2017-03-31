package test
{
	import laya.debug.tools.XML2Object;
	import laya.net.Loader;
	import laya.utils.Handler;

	public class XMLTest
	{
		private var url:String = "res/config/versionConfig.xml";
		
		public function XMLTest()
		{
			Laya.loader.load(url, Handler.create(this, onLoadComplete), null, Loader.XML);
		}
		
		private function onLoadComplete():void
		{
			var xml:XML = Loader.getRes(url);
			trace("xml:::",xml);
			var obj:Object = XML2Object.parse(xml);
			trace("obj:::",obj);
		}
	}
}