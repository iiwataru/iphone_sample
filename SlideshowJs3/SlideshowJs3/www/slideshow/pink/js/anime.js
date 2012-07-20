var circles = new Array();
var idx=0;
const CIRCLE_NUM = 20;
window.onload = function(){

	// STAR
	star1 = new PinkStar($('#star-box1'), 'star1');
	star2 = new PinkStar($('#star-box2'), 'star2');
	star3 = new PinkStar($('#star-box3'), 'star3');

	$('#stage').bind('click', function() {
		setTimeout('star1.start()', 0);
		setTimeout('star2.start()', 300);
		setTimeout('star3.start()', 600);
	});

	// CIRCLE
	for (i=0; i<CIRCLE_NUM; i++) {
		boxId = 'box'+i;
		circleId = 'circle'+i;
		box = jQuery('<div id="' + boxId + '" class="box">');
		box.css({left: Math.floor( Math.random() * 60 )});
		$('#stage').append(box);
		
		circle = new CirclePink($('#'+boxId), circleId);
		circles.push(circle);
	}
	
	$('#stage').bind('click', function() {
		for (i=0; i<circles.length; i++) {
			setTimeout('play();', i*100);
		}

	});
}

function play(){
	circles[idx].start();
	idx++;
	if ( idx == CIRCLE_NUM) {
		idx=0;
	}
}

