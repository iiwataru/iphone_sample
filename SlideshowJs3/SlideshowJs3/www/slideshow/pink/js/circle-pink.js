/**
 * @author �ѓc �j
 * 
 * ���̃A�j���[�V�����N���X
 */
var CirclePink;

(function() {
	/**
	 * @constructor
	 *
	 * @param parent �eDOM
	 * @param id ����ID
	 */
	CirclePink = function(parent, id) {
		
		this.parent = parent;
		this.id = id;
		
		// �O��
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
		 * ��������
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
		 * �A�j���[�V�����J�n
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