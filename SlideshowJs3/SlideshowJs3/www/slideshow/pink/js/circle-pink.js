/**
 * @author 飯田 亘
 * 
 * 星のアニメーションクラス
 */
var CirclePink;

(function() {
	/**
	 * @constructor
	 *
	 * @param parent 親DOM
	 * @param id 星のID
	 */
	CirclePink = function(parent, id) {
		
		this.parent = parent;
		this.id = id;
		
		// 軌道
		this.pos = 
		[
			{x:20 ,y:0  },
			{x:50,y:20 },
			{x:70,y:30 },
			{x:100,y:70},
			{x:150,y:100},
			{x:170,y:110},
			{x:200,y:120},
			{x:250,y:140},
			{x:280,y:160},
			{x:320,y:200}
		];
		
		this.init();
	};
	
	CirclePink.prototype = {
		
		/**
		 * @private
		 *
		 * 初期処理
		 */
		init : function() {
			this.base = jQuery('<div id="' + this.id + '" class="circle">');
			this.base.append('<img src="img/circle_pink.png">');
			this.parent.append(this.base);
		},
		
		play : function() {
			this.start();
//			setTimeout();
		},
		
		/**
		 * @public
		 *
		 * アニメーション開始
		 */
		start : function() {
			obj = this.base;
			for (i=0; i<this.pos.length; i++)
			{
				obj = obj.animate(
					{left:this.pos[i]["x"]+'px', top:this.pos[i]["y"]+'px'},
					{duration:200, easing:'linear'}
				);
			}
		},
		
	};
})();