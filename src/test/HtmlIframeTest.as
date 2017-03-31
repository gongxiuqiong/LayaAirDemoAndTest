package test
{
	import laya.html.dom.HTMLIframeElement;

	public class HtmlIframeTest
	{
		public function HtmlIframeTest()
		{
			var iframe:HTMLIframeElement = new HTMLIframeElement();
			iframe.href = "http://localhost/NewLuckyBigWheel/";
			Laya.stage.addChild(iframe);
			return;
			var myiframe:* = __JS__("document.createElement('iframe')");
			myiframe.style.position ="absolute";
			myiframe.style.zIndex = 9999999;
			myiframe.style.top = "0px";
			myiframe.style.left = "200px";
			myiframe.style.width = "1280px";
			myiframe.style.height = "900px";
			myiframe.src = "http://localhost/NewLuckyBigWheel/";//"http://10.50.200.123:8080/";
			__JS__('document.body.appendChild(myiframe)');//添加在舞台上
//			__JS__('document.body.removeChild(myiframe)');//删除舞台上
			
			myiframe.style.display="block"; //显示
			
//			myiframe.style.display="none"; //不显示
			
			
			var uiW:Number=__JS__('document.body.clientWidth');//可监听浏览器大小
			var uiH:Number=__JS__('document.body.clientHeight');
		}
	}
}