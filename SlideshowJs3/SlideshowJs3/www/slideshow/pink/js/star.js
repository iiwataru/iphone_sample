/**
 * @author �ѓc �j
 * 
 * ���̃A�j���[�V�����N���X
 */
var PinkStar;

(function() {
	/**
	 * @constructor
	 *
	 * @param parent �eDOM
	 * @param id ����ID
	 */
	PinkStar = function(parent, id) {
		
		this.parent = parent;
		this.id = id;
		
		// �O��
		this.pos = 
		[
			{r:0  , s:0.6},
			{r:40 , s:0.8},
			{r:80 , s:1.1},
			{r:120, s:1.1},
			{r:160, s:0.9},
			{r:200, s:0.8},
			{r:240, s:0.6},
			{r:280, s:0.4},
			{r:320, s:0.3},
			{r:360, s:0.0},
			{r:40 , s:0.2},
			{r:80 , s:0.4},
			{r:120, s:0.3},
			{r:160, s:0.0}
		];
		
		this.init();
	};
	
	PinkStar.prototype = {
		
		/**
		 * @private
		 *
		 * ��������
		 */
		init : function() {
			this.base = jQuery('<div id="' + this.id + '" class="star">');
			this.base.append('<img src="img/star.png">');
			this.parent.append(this.base);
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
					{rotate:this.pos[i]["r"]+'deg', scale:this.pos[i]["s"]},
					{duration:200, easing:'linear'}
				);
			}
		},
		
	};
})();