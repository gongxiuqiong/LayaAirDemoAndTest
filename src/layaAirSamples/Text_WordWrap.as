package layaAirSamples
{
	import laya.display.Stage;
	import laya.display.Text;
	
	public class Text_WordWrap
	{
		public function Text_WordWrap()
		{
			Laya.init(550, 400);
			Laya.stage.scaleMode = Stage.SCALE_SHOWALL;
			
			var txt:Text = new Text();
			
			txt.text = "Layabox是性能最强的HTML5引擎技术提供商与优秀的游戏发行商，面向Flash开发者提供HTML5开发技术方案！";
			
			txt.pos(120, 20);
			txt.width = 300;
			
			txt.fontSize = 40;
			txt.color = "#ffffff";
			
			//设置文本为多行文本
			txt.wordWrap = true;
			
			Laya.stage.addChild(txt);
		}
	}
}