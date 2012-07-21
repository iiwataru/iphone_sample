/**
 * 定数
 */
const MOVE_DURATION = 1000;
const SLIDESHOW_INTERVAL = 2500;

/**
 * 変数
 */
var timer;
var images = [];
var idxImages = 0;
//var cntImages = 0;
var audio = null;

/**
 * 画像パスリストをセットする
 *
 * @param imgs 画像パスの配列
 */
function setImages(imgs)
{
    images = imgs;
}

function initImage()
{
//    alert("initImage");
    images = Array();
}

/**
 * 画像パスを追加でセットする
 *
 * @param img 画像パス
 */
function addImage(img)
{
//    alert(img);
    images.push(img);
}

/**
 * 再生
 */
function play()
{
    idxImages = 0;
    
//    if (audio == null)
//    {
//        audio = document.getElementById("audio");
//        audio.play();
//        audio.addEventListener("canplay", function(){
//                               nextImage();
//                               }, false);
//    } else {
//        audio.play();
        nextImage();
//    }
}

/**
 * 次を表示
 */
function nextImage()
{
    ret = false;
    
    if (images != null &&
        images.length > 0 &&
        images.length > idxImages)
    {
//        alert("nextImage");
        id = 'box' + idxImages;
        $('#' + id).remove();
        
        // 枠を追加
        $('#wrap').append('<div id="' + id + '" class="box"><div>');
        
        // アニメーション
        $('#' + id)
        .animate({'left': '290px', opacity: 'hide'}, 0)
        .animate({'left': '32px', opacity: 'show'}, MOVE_DURATION)
        .delay(SLIDESHOW_INTERVAL)
        .animate({'left': '-210px', opacity: 'hide'}, MOVE_DURATION)
        ;
        
        // 画像を追加
        imgId = 'img' + idxImages;
        $('#' + id).html('<img src="' + images[idxImages++] + '" id="' + imgId + '">');
        
        // 画像を一定サイズに収める
        $('#' + imgId).bind('load', function(){
                            ratioW = 240 / $('#' + imgId).width();
                            ratioH = 240 / $('#' + imgId).height();
                            $('#' + imgId).css({'zoom': Math.min(ratioW, ratioH)});
                            });
        
        // 次の画像を表示予約
        timer = window.setTimeout("nextImage()", SLIDESHOW_INTERVAL + MOVE_DURATION);
        
        ret = true;
    }
    return ret;
}

/**
 * 停止
 */
function stop()
{
    //    clearTimeout(timer);
}

// 音楽の再生
function audioPlay(){
    document.getElementById("audio").play();
}

$(document).ready(function(){
                  // ここに実際の処理を記述します。
//                  alert("ready");
                  });