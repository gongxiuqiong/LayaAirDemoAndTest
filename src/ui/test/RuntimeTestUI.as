/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 
	import view.RunTimeTestView;
	import laya.display.Text;

	public class RuntimeTestUI extends View {
		public var txt:Text;

		public static var uiView:Object ={"type":"View","props":{"width":600,"runtime":"view.RunTimeTestView","height":400},"child":[{"type":"Text","props":{"y":99,"x":164,"width":199,"var":"txt","text":"text","name":"txt","height":32,"fontSize":"24","color":"#ffffff"}}]};
		public function RuntimeTestUI(){}
		override protected function createChildren():void {
			View.regComponent("view.RunTimeTestView",RunTimeTestView);
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);
		}
	}
}