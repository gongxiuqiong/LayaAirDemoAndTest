package
{
	import laya.display.Stage;
	import laya.net.Loader;
	import laya.utils.Handler;
	
	import layaAirSamples.UI_List;
	import layaAirSamples.UI_Slider;
	
	import test.ColorTest;
	import test.GoToUrlTest;
	import test.GraphicTest;
	import test.HtmlIframeTest;
	import test.LoadHtmlTest;
	import test.McTest;
	import test.RoundLoadingTest;
	import test.SkTest;
	import test.ToolTipDemo;
	import test.htmlAniTest.HtmlAniTest;
	import test.mouseTip.MouseTipTest;
	
	import view.TestView;
	
	public class Main
	{
		public function Main()
		{
			Laya.init(1280,900);
//			Stat.show(10,10);
			Laya.stage.screenMode = Stage.SCREEN_NONE;//Stage.SCREEN_HORIZONTAL;
			Laya.stage.alignH = "center";
			Laya.stage.alignV = "top";
			Laya.stage.bgColor = "#cccccc";
			Laya.stage.alignH = "center";
			Laya.stage.alignV = "top";
			
//			new HtmlAniTest();
//			new LoadHtmlTest();
//			new HtmlIframeTest();
			new GoToUrlTest();
//			new UI_List();
//			new UI_Slider();
//			Laya.loader.load("res/atlas/comp.json", Handler.create(this, onLoadComplete), null, Loader.ATLAS);
		}
		
		private function onLoadComplete():void
		{
			Laya.stage.addChild(new TestView());
		}
	}
}