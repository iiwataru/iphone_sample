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
    images = Array();
}

/**
 * 画像パスを追加でセットする
 *
 * @param img 画像パス
 */
function addImage(img)
{
    images.push(img);
}

/**
 * 再生
 */
function play()
{
    idxImages = 0;
    
    if (audio == null)
    {
        audio = document.getElementById("audio");
        audio.play();
        audio.addEventListener("canplay", function(){
                               nextImage();
                               }, false);
    } else {
        audio.play();
        nextImage();
    }
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
        boxId = 'box' + idxImages;
        
        // 枠を追加
        $('#wrap').append('<div id="' + boxId + '" class="box"><div>');
        
        // 画像を追加
        imgId = 'img' + idxImages;
        $('#' + boxId).css({opacity: 0});
        $('#' + boxId).html('<img src="' + images[idxImages++] + '" id="' + imgId + '">');
        $('#' + imgId).hide();
        
        // 画像を一定サイズに収める
        $('#' + imgId).bind('load', boxId, function(event){
                            
                            boxIdData = event.data;
                            
//                            $('#' + imgId).hide();
                            ratioW = 240 / $('#' + imgId).width();
                            ratioH = 240 / $('#' + imgId).height();
                            $(this).css({'zoom': Math.min(ratioW, ratioH)});
                            
                            $('#' + boxIdData)
                            .animate({left: '290px', opacity: 'hide'},
                                     {duration: 0,
                                     easing: "linear",
                                     complete: function(){
                                        $(this).find("img").show();
                                        $(this).css({opacity: 1});
                                     }
                                     });
                            
                            // アニメーション
                            $('#' + boxIdData)
                            .animate({left: '32px', opacity: 'show'}, MOVE_DURATION)
                            .delay(SLIDESHOW_INTERVAL)
                            .animate({left: '-210px', opacity: 'hide'},
                                     {duration: MOVE_DURATION,
                                     easing: "linear",
                                     complete: function(){$(this).remove();}
                                     })
                            ;
                            
                            // 次の画像を表示予約
                            timer = window.setTimeout("nextImage()", SLIDESHOW_INTERVAL + MOVE_DURATION);
                           });
        
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