package
{
	import laya.display.Stage;
	
	import layaAirSamples.UI_List;
	
	import test.ColorTest;
	import test.McTest;
	import test.SkTest;
	import test.ToolTipDemo;
	import test.htmlAniTest.HtmlAniTest;
	
	public class Main
	{
		public function Main()
		{
			Laya.init(1280,900);
//			Stat.show(10,10);
			Laya.stage.screenMode = Stage.SCREEN_NONE;//Stage.SCREEN_HORIZONTAL;
			Laya.stage.alignH = "center";
			Laya.stage.alignV = "top";
			Laya.stage.bgColor = "#000000";
			Laya.stage.alignH = "center";
			Laya.stage.alignV = "top";
			
//			new HtmlAniTest();
			
//			new UI_List();
			new SkTest();
		}
	}
}