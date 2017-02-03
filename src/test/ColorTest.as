package test
{
	import laya.debug.tools.ColorTool;
	import laya.filters.ColorFilter;
	import laya.ui.Image;
	import laya.ui.UIUtils;

	public class ColorTest
	{
		public function ColorTest()
		{
			var img:Image = new Image();
			img.skin = "res/img/img_tonghuashun2.png";
			Laya.stage.addChild(img);
			
//			var arr:Array = ColorTool.getRGBByRGBStr("#c1c126");
			var color:int=0xE0E502;
			var r:int=color>>16&0xff;
			var g:int=color>>8&0xff;
			var b:int=color&0xff;
			trace(r,g,b);
//			mc.filters =new ColorFilter([r/255,0,0,0,0,
//				0,g/255,0,0,0,
//				0,0,b/255,0,0,
//				0,0,0,1,0]);
//			var filter:ColorFilter = new ColorFilter([61/100,0,0,224/255,0,
//													0,99/100,0,229/255,0,
//													0,0,90/100,2/255,0,
//													0,0,0,100/100,0]);
//			var filter:ColorFilter = new ColorFilter([255/255,0,0,0,0,
//				0,255/255,0,0,0,
//				0,0,51/255,0,0,
//				0,0,0,1,0]);
			var filter:ColorFilter = getColorFilter(color);
			UIUtils.addFilter(img, filter);
//			img.filters = [filter];
			
//			mc.filters =[new ColorMatrixFilter([100/100,0,0,255/255,0,
//				0,100/100,0,80/255,0,
//				0,0,20/100,55/255,0,
//				0,0,0,100/100,0])];
		}
		
		private function getColorFilter($color:int):ColorFilter
		{
			var filter:ColorFilter;
			var r:int=$color>>16&0xff;
			var g:int=$color>>8&0xff;
			var b:int=$color&0xff;
			filter = new ColorFilter([r/255,0,0,0,0,
				0,g/255,0,0,0,
				0,0,b/255,0,0,
				0,0,0,1,0]);
			return filter;
		}
		
	}
}