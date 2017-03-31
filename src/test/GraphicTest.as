package test
{
	import laya.display.Sprite;

	public class GraphicTest
	{
		public function GraphicTest()
		{
			var sp:Sprite = new Sprite();
			Laya.stage.addChild(sp);
//			sp.graphics.drawCircle(150,150,100, "#ffd125");
			
//			var path:Array = [];
//			path.push(0, -130);
//			path.push(33, -33 );
//			path.push(137, -30);
//			path.push(55, 32);
//			path.push(85, 130);
//			path.push(0, 73);
//			path.push(-85, 130);
//			path.push(-55, 32);
//			path.push(-137, -30);
//			path.push(-33, -33 );
//			sp.graphics.drawPoly(Laya.stage.width / 2, Laya.stage.height / 2, path, "#FF7F50");
			
			var pointsArr:Array = [0,0,1280,0,1280,900,0,900,0,0];
			sp.graphics.drawLines(0,0,pointsArr, "#ffffff", 30);
		}
	}
}