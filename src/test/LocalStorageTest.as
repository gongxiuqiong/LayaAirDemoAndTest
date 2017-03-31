package test
{
	import laya.net.LocalStorage;

	public class LocalStorageTest
	{
		private const key:String = "KEY";
		
		public function LocalStorageTest()
		{
//			LocalStorage.clear();
//			return;
			var obj:Object = LocalStorage.getJSON(key);
			if(obj)
			{
				trace("有存储对象");
				obj.count++;
				LocalStorage.setJSON(key, obj);
			}
			else
			{
				trace("没有存储对象");
				var saveObj:Object = new Object();
				saveObj.name = "存储测试对象";
				saveObj.count = 1;
				LocalStorage.setJSON(key, saveObj);
			}
			trace(LocalStorage.getJSON(key));
		}
	}
}