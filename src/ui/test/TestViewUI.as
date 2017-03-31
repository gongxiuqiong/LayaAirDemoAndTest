/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 

	public class TestViewUI extends View {
		public var progressBar:ProgressBar;

		public static var uiView:Object ={"type":"View","props":{"width":600,"height":400},"child":[{"type":"ProgressBar","props":{"y":175,"x":137,"var":"progressBar","skin":"template/progress.png","name":"progressBar"}}]};
		public function TestViewUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}