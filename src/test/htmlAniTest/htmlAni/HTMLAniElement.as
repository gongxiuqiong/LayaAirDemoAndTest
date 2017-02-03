package test.htmlAniTest.htmlAni
{
	import laya.display.ILayout;
	import laya.display.Sprite;
	import laya.display.css.CSSStyle;
	import laya.events.Event;
	import laya.html.dom.HTMLElement;
	import laya.net.Loader;
	import laya.renders.Render;
	import laya.renders.RenderContext;
	import laya.resource.Texture;
	import laya.utils.Handler;
	import laya.utils.Stat;
	
	/**
	 * @private
	 */
	public class HTMLAniElement extends HTMLElement 
	{
		private var _tex:Texture;
		private var _url:String;
		private var _renderArgs:Array = [];
		
		public function HTMLAniElement() 
		{
			super();
			style.block = true;
		}
		
		public function set src(url:String):void
		{
			if (url.lastIndexOf(".json") != -1){
				loadAtlas(url, url);
				return ;
			}
			skin = url ;
		}
		
		private function set skin(url:String):void{
			url = formatURL(url);
			if (_url == url) return;
			_url = url;
			_tex = Loader.getRes(url)
			if (!_tex) {
				_tex = new Texture();
				_tex.load(url);
				Loader.cacheRes(url, _tex);
			}
			
			var tex:Texture = _tex=Loader.getRes(url);
			if (!tex) {
				_tex = tex=new Texture();
				tex.load(url);
				Loader.cacheRes(url, tex);
			}
			
			function onloaded():void
			{
				var style:CSSStyle = _style as CSSStyle;				
				var w:Number = style.widthed(this)? -1:_tex.width;
				var h:Number = style.heighted(this)? -1:_tex.height;
				
				if (!style.widthed(this) && _width != _tex.width )
				{
					width = _tex.width;
					parent && (parent as Sprite)._layoutLater();
				}

				if (!style.heighted(this) && _height != _tex.height )
				{
					height = _tex.height;
					parent && (parent as Sprite)._layoutLater();
				}
				if (Render.isConchApp)
				{
					_renderArgs[0] = _tex;
					_renderArgs[1] = x;
					_renderArgs[2] = y;
					_renderArgs[3] = width || _tex.width;
					_renderArgs[4] = height || _tex.height;
					graphics.drawTexture(_tex, 0, 0, _renderArgs[3], _renderArgs[4]);
					//context.ctx.drawTexture2(0, 0, style.translateX, style.translateY, transform, style.alpha, style.blendMode, _renderArgs);
				}
			}
			
			tex.loaded?onloaded():tex.on(Event.LOADED, null, onloaded);	
		}
		
		public override function _addToLayout(out:Vector.<ILayout>):void
		{
			!_style.absolute && out.push(this);
		}
		
		override public function render(context:RenderContext, x:Number, y:Number):void {

			if (!_tex || !_tex.loaded || !_tex.loaded || _width < 1 || _height < 1) return;
			
			Stat.spriteCount++;
			
			//tx:Texture, x:Number, y:Number, width:Number, height:Number
			_renderArgs[0] = _tex;
			_renderArgs[1] = this.x;
			_renderArgs[2] = this.y;
			_renderArgs[3] = width || _tex.width;
			_renderArgs[4] = height || _tex.height;
			context.ctx.drawTexture2(x, y, style.translateX, style.translateY, transform, style.alpha, style.blendMode, _renderArgs);
		}
		
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// @ luohuantao  添加
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		public static var framesMap:Object = {};
		private static const interval_luo:int = 100 ;
		/**
		 * 加载并播放一个图集。
		 * @param	url 	图集地址。
		 * @param	loaded	加载完毕回调
		 * @param	cacheName 缓存为模板的名称，下次可以直接使用play调用，无需重新创建动画模板，设置为空则不缓存
		 * @return 	返回动画本身。
		 */
		public function loadAtlas(url:String, cacheName:String = ""):HTMLAniElement {
			var _this:HTMLAniElement = this;
			function onLoaded(loadUrl:String):void {
				if (url === loadUrl) {
					_this.textureArr = createFrames(url, !framesMap[cacheName] ? cacheName : "")
					
					var style:CSSStyle = _style as CSSStyle;			
					_tex = _this._textureArr[0] ;
					if (!style.widthed(this) && _width != _tex.width )
					{
						width = _tex.width;
						parent && (parent as Sprite)._layoutLater();
					}

					if (!style.heighted(this) && _height != _tex.height )
					{
						height = _tex.height;
						parent && (parent as Sprite)._layoutLater();
					}
				}
			}
			if (Loader.getAtlas(url)) onLoaded(url);
			else Laya.loader.load(url, Handler.create(null, onLoaded, [url]), null, Loader.ATLAS);
			return this;
		}
		
		/**
		 * 创建动画模板，相同地址的动画可共享播放模板，而不必每次都创建一份新的，从而节省创建Graphics集合的开销
		 * @param	url 图集路径(已经加载过的)或者url数组(可以异步加载)
		 * @param	name 全局动画名称，如果name不为空，则缓存动画模板，否则不缓存
		 * @return	Graphics动画模板
		 */
		public static function createFrames(url:*, name:String):Array {
			var textureArr:Array;
			if (url is String) {
				var atlas:Array = Loader.getAtlas(url);
				if (atlas && atlas.length) {
					textureArr = [];
					for (var i:int = 0, n:int = atlas.length; i < n; i++) {
						textureArr.push(Loader.getRes(atlas[i]));
					}
				}
			}
			return textureArr;
		}
		
		////////////////////////////////////////////////////////
		////  播放动画公用函数
		////////////////////////////////////////////////////////
		
		
		private var _textureArr:Array ;
		private var _count:int ;
		private var _index:int = 0 ;
		public function set textureArr(value:Array):void 
		{
			_textureArr = value;
			if (value) {
				this._count = value.length;
				if (this._count > 1) {
					timerLoop(interval_luo, this, _frameLoop, null, true);
				}
			}
		}
		/**@private */
		protected function _frameLoop():void {
			this._index++;
			if (this._index >= this._count) {
				this._index = 0;
			}
			if (this._textureArr && this._textureArr[_index]){
				_tex = _textureArr[_index] ;
			}
		}
	}

}