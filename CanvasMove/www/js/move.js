/**
 * 定数と変数を宣言
 */
var canvas_main;            // 画像を描画するcanvas
var context_main;           // canvas_mainのcontext
var canvas_image;           // 横長画像を描画するcanvas
var context_image;          // canvas_imageのcontext 
var panorama = new Image(); // 表示する画像データ
var translate_value = 0;    // スクロール速度
var timer;                  // タイマー
var frame_rate = 30;        // １秒あたりの描画数(スクロール数)

//------------------------------------------------------
/* isMoveWritePoint(型:boolean) */
var isMoveWritePoint = true;
/* trueの場合:canvasへの描画位置を移動する
 * falseの場合:isMoveCopyCanvas判断を行なう */

/* isMoveCopyCanvas(型:boolean) */
var isMoveCopyCanvas = true;
/* trueの場合:切り抜いて他canvasで表示
 * falseの場合:canvas自体の位置を移動する */
//------------------------------------------------------

/**
 * htmlの読み込み終了時処理
 */
function didLoadHtml() {

    // canvasへの描画位置を変更して画面スライドを実装
    if (isMoveWritePoint) {
        // canvas_mainを取得
        canvas_main = document.getElementById("canvas_main");
        // canvas_mainの横幅を画面のwindth,縦幅を画面のheightにする
        canvas_main.width = document.body.clientWidth;
        canvas_main.height = document.body.clientHeight;
        // canvas_mainのcontextを取得
        context_main = canvas_main.getContext("2d");
        // 画像を読み込む
        panorama.src = "../image/panorama_image.jpeg";

        // 画像の読み込みが終了したイベント
        panorama.onload = function() {
            // canvasへ画像を描画
            context_main.drawImage(panorama, 0, 0, canvas_main.width*10, canvas_main.height);
            moveWritePoint();
        }
    }
    // isMoveCopyCanvasの値判断
    else {
        // 横長canvasから表示部分だけを切り抜き表示用canvasに表示して画面スライドを実装
        if (isMoveCopyCanvas) {
            // canvas_mainを取得
            canvas_main = document.getElementById("canvas_main");
            // canvas_imageを取得
            canvas_image = document.getElementById("canvas_image");
            // canvas_mainの横幅を画面のwindth,縦幅を画面のheightにする
            canvas_main.width = document.body.clientWidth;
            canvas_main.height = document.body.clientHeight;
            // canvas_imageの横幅を画面のwindth*10,縦幅を画面のheightにする
            canvas_image.width = document.body.clientWidth*10;
            canvas_image.height = document.body.clientHeight;
            // canvas_mainのcontextを取得
            context_main = canvas_main.getContext("2d");
            // canvas_imageのcontextを取得
            context_image = canvas_image.getContext("2d");
            // 画像を読み込む
            panorama.src = "../image/panorama_image.jpeg";
            // canvas_imageを非表示にする
            $("#canvas_image").css("display", "none");
            
            // 画像の読み込みが終了したイベント
            panorama.onload = function() {
                // canvas_imageへ画像を描画
                context_image.drawImage(panorama, 0, 0, canvas_image.width, canvas_image.height);
                // canvas_mainへ画像を描画
                context_main.drawImage(canvas_image, translate_value, 0, canvas_main.width,
                                       canvas_main.height, 0, 0, canvas_main.width, canvas_main.height);
                moveCopyCanvas();
            }
        }
        // canvas自体の位置を変更して画面スライドを実装
        else {
            // canvas_mainを取得
            canvas_main = document.getElementById("canvas_main");
            // canvas_mainの横幅を画面のwindth*10,縦幅を画面のheightにする
            canvas_main.width = document.body.clientWidth*10;
            canvas_main.height = document.body.clientHeight;
            // canvas_mainのcontextを取得
            context_main = canvas_main.getContext("2d");
            
            // canvas_mainのleft属性を有効にする為にpositionを変更
            $("#canvas_main").css("position", "absolute");
            // 画像を読み込む
            panorama.src = "../image/panorama_image.jpeg";

            // 画像の読み込みが終了したイベント
            panorama.onload = function() {
                // canvasへ画像を描画
                context_main.drawImage(panorama, 0, 0, canvas_main.width, canvas_main.height);
                moveCanvas();
            }
        }
    }
}

/**
 * canvas_mainへの描画位置を移動　
 */
function moveWritePoint() {
    // まだスクロール可能な場合
    if (Math.abs(translate_value) + canvas_main.width <= canvas_main.width*10) {
        // スクロールするスピードを設定
        translate_value = translate_value - 1;
        // canvas_mainの内容を削除
        context_main.clearRect(0, 0, canvas_main.width, canvas_main.height);
        // 再描画
        context_main.drawImage(panorama, translate_value, 0, canvas_main.width*10, canvas_main.height);
        // 再描画を予約
        timer = setTimeout("moveWritePoint()", 1000 / frame_rate);
    }
}

/**
 * 横長canvasから表示部分だけを切り抜き表示用canvasに表示して画面スライドを実装
 */
function moveCopyCanvas() {
    // まだスクロール可能な場合
    if (Math.abs(translate_value) + canvas_main.width <= canvas_image.width) {
        // スクロールするスピードを設定
        translate_value = translate_value + 1;
        // canvas_mainの内容を削除
        context_main.clearRect(0, 0, canvas_main.width, canvas_main.height);
        // 再描画
        context_main.drawImage(canvas_image, translate_value, 0, canvas_main.width,
                               canvas_main.height, 0, 0, canvas_main.width, canvas_main.height);
        // 再描画を予約
        timer = setTimeout("moveCopyCanvas()", 1000 / frame_rate);
    }
}

/**
 * canvas_main自体の位置を移動
 */
function moveCanvas() {
    // まだスクロール可能な場合
    if (Math.abs(translate_value) + canvas_main.width/10 <= canvas_main.width) {
        // スクロールするスピードを設定
        translate_value = translate_value - 1;
        // canvas_mainのleft属性をtranslate_valueにする
        $("#canvas_main").css("left", translate_value + "px");
        // 自身を予約
        timer = setTimeout("moveCanvas()", 1000 / frame_rate);
    }
}