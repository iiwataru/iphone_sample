/**
 * クラスの読み込み
 */
//document.write('<script type="text/javascript" src="../js/slides/star.js"></script>');
//document.write('<script type="text/javascript" src="slides/star.js"></script>');

/**
 * 定数と変数を宣言
 */
var canvas_back; // 背景用canvas
var context_back; // 背景用canvasのcontext
var canvas_main; // 描画用canvas
var context_main; // 描画用canvasのcontext
var images_path = ["umi1.jpeg", "umi2.jpeg", "umi3.jpeg", "umi4.jpeg", "umi5.jpeg"]; // スライドショー用のイメージ配列
var frame_rate = 30; // フレームレート
var timer; // 描画を繰り返す為のタイマー

var stars = []; // Starクラスを入れる為の配列
var words = []; // Wordクラスを入れる為の配列

var first_star;
var first_word;
var secound_star;
var secound_word;
var star_image = new Image();
var word_image = new Image();

/**
 * htmlの読み込み終了時処理
 */
function didLoadHtml() {

    // 背景用canvasを取得
    canvas_back = document.getElementById("canvas_back");
    // 描画用canvasを取得
    canvas_main = document.getElementById("canvas_main");
    
    // canvasサイズを画面サイズと同じに設定
    canvas_back.width = document.body.clientWidth;
    canvas_back.height = document.body.clientHeight;
    canvas_main.width = document.body.clientWidth;
    canvas_main.height = document.body.clientHeight;
    
    // 背景用canvasのcontextを取得
    context_back = canvas_back.getContext("2d");
    // 描画用canvasのcontextを取得
    context_main = canvas_main.getContext("2d");

    // 背景用の画像を設定
    setBackImage();
}

/**
 * 背景画像の設定処理
 */
function setBackImage() {

    // 背景画像(グラデーション)を読み込む
    var back_image = new Image();
    back_image.src = "../image/bg.png";
    // 背景画像(HAPPYBIRTHDAYTOYOU)を読み込む
    var title_image = new Image();
    title_image.src = "../image/sousyoku_t3.png";

    /**
     * 背景画像(グラデーション)読み込み終了時処理
     */
    back_image.onload = function() {
        context_back.drawImage(back_image, 0, 0, canvas_back.width, canvas_back.height);
    }
    /**
     * 背景画像(HAPPYBIRTHDAYTOYOU)読み込み終了時処理
     */
    title_image.onload = function() {
        context_back.drawImage(title_image, 0, 0, canvas_back.width, 35);
    }
    
    timer = setTimeout("setSlideshow()",1000);
}

/**
 * スライドショーの再生準備処理
 */
function setSlideshow() {
    first_star = new Star(100, 150, 50, 50);
    star_image.src = "../image/star_box.png?" + new Date().getTime();
    first_word = new Word(40, 200, 270, 130);
    word_image.src = "../image/hb_txt0001.png?" + new Date().getTime();
    
    star_image.onload = function() {
        word_image.onload = function() {
            play();
        }
    }
}

/**
 * スライドショーを開始する
 */
function play() {
    var rotate_point_x = 0; // 画像回転の中心になるx座標
    var rotate_point_y = 0; // 画像回転の中心になるy座標
    var success = false;

    // canvas_mainの内容を消去(黒の透明度100%で上書き)
    context_main.clearRect(0, 0, canvas_main.width, canvas_main.height);
    // 星画像がまだ描画可能状態
    if(first_star.enable) {
        var angle = first_star.getAngle();
        // 回転中心のx座標を画像の中心に設定
        rotate_point_x = first_star.point_x + first_star.size_w / 2 -3;
        // 回転中心のy座標を画像の中心に設定
        rotate_point_y = first_star.point_y + first_star.size_h / 2 -3;
        // 回転を行なう為に回転の中心位置を変更
        context_main.translate(rotate_point_x, rotate_point_y);
        // 回転の実行
        context_main.rotate(angle * Math.PI / 180);
        // 変更した回転位置を元に修正
        context_main.translate(-1 * rotate_point_x, -1 * rotate_point_y);
        // 透明度を設定
        context_main.globalAlpha = first_star.alpha;
        // 画像の描画
        context_main.drawImage(star_image,
                              first_star.point_x,
                              first_star.point_y,
                              first_star.size_w,
                              first_star.size_h);
        // 逆回転を行なう為に回転の中心位置を変更
        context_main.translate(rotate_point_x, rotate_point_y);
        // 逆回転の実行
        context_main.rotate(-(angle * Math.PI / 180));
        // 変更した回転位置を元に修正
        context_main.translate(-1 * rotate_point_x, -1 * rotate_point_y);
        // 再描画フラグをtrueに変更
        success = true;
    }

    // 文字画像がまだ描画可能状態
    if (first_word.enable) {
        // スケール(画像サイズ倍率を取得)
        var scale = first_word.getScale();
        // 透明度を設定
        context_main.globalAlpha = first_word.alpha;
        // 画像の描画
        context_main.drawImage(word_image,
                               first_word.point_x,
                               first_word.point_y,
                               first_word.size_w * scale,
                               first_word.size_h * scale);
        success = true;
    }

    // 再描画フラグがtrueの場合
    if (success) {
        // 再描画を予約
        timer = setTimeout("play()", 1000 / frame_rate);
    }
    // すべての描画が終了している
    else {
        //timer = setTimeout("setMainSlideshow()", 1000);
        setMainSlideshow();
    }
}

/**
 * 本編を再生の準備処理
 */
function setMainSlideshow() {
    secound_star = new Star(200, 180, 40, 40);
    secound_word = new Word(50, 280, 210, 100);
    //timer = setTimeout("MainPlay()",1000);
    MainPlay();
}

function MainPlay() {
    var success = false;
    
    // canvas_mainの内容を消去(黒の透明度100%で上書き)
    context_main.clearRect(0, 0, canvas_main.width, canvas_main.height);
    
    if(secound_star.enable) {
        var angle = secound_star.getAngle();
        rotate_point_x = secound_star.point_x + secound_star.size_w / 2 -3;
        rotate_point_y = secound_star.point_y + secound_star.size_h / 2 -3;
        context_main.translate(rotate_point_x, rotate_point_y);
        context_main.rotate(angle * Math.PI / 180);
        context_main.translate(-1 * rotate_point_x, -1 * rotate_point_y);
        context_main.globalAlpha = secound_star.alpha;
        context_main.drawImage(star_image,
                               secound_star.point_x,
                               secound_star.point_y,
                               secound_star.size_w,
                               secound_star.size_h);
        context_main.translate(rotate_point_x, rotate_point_y);
        context_main.rotate(-(angle * Math.PI / 180));
        context_main.translate(-1 * rotate_point_x, -1 * rotate_point_y);
        success = true;
    }
    
    
    if (secound_word.enable) {
        var scale = secound_word.getBeatScale();
        context_main.globalAlpha = secound_word.alpha;
        context_main.drawImage(word_image,
                               secound_word.point_x,
                               secound_word.point_y,
                               secound_word.size_w * scale,
                               secound_word.size_h * scale);
        success = true;
    }
    
    if (success) {
        timer = setTimeout("MainPlay()", 1000 / frame_rate);
    } else {
    }
}