/**
 * 定数
 */
const MOVE_DURATION = 1000;
const SLIDESHOW_INTERVAL = 2000;

/**
 * 変数
 */
var timer;
var images = null;
var idxImages = 0;

/**
 * 画像パスリストをセットする
 *
 * @param imgs 画像パスの配列
 */
function setImages(imgs)
{
    images = imgs;
}

/**
 * 再生
 */
function play()
{
    idxImages = 0;
    nextImage();
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
        id = 'box' + idxImages;
        
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
