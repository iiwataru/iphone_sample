/**
 * 定数と変数を宣言
 */
var canvas;                 // 画像を描画するcanvas
var context;                // canvasのcontext
var image = new Image();    // リンゴの画像
var mask = new Image();     // マスク用画像
var timer;                  // タイマー
var frame_rate = 30;        // フレームレート

/**
 * htmlの読み込み終了時処理
 */
function didLoadHtml() {

    // マスク用画像の読み込み
    mask.src = '../image/circle.png';
    // canvas_mainを取得
    canvas = document.getElementById('canvas');
    // canvas_mainの横幅を画面のwindth,縦幅を画面のheightにする
    canvas.width = document.body.clientWidth;
    canvas.height = document.body.clientHeight;
    // canvas_mainのcontextを取得する
    context = canvas.getContext('2d');
    // 画像を読み込む
    image.src = '../image/apple.jpeg';

    // 画像の読み込みが終了したイベント
    image.onload = function() {
        // canvasへ画像を描画する
        context.drawImage(image, 0, 0, canvas.width, canvas.height);
    }
}

/**
 * 段々暗くなる処理準備
 */
function initFadeBlack() {
    // マスクの初期サイズを設定する
    initMaskSize = Math.sqrt(canvas.width * canvas.width + canvas.height * canvas.height);
    // キャンバス背景を黒に変更する
    $('canvas').css('background-color', '#000');
    // 暗くなっていく処理を実行する
    FadeBlack(initMaskSize);
}
/**
 * 段々暗くなる処理
 */
function FadeBlack(mask_size) {
    // マスク画像サイズが０以上の場合
    if (mask_size > 0) {
        // キャンバスをクリアする
        context.clearRect(0, 0, canvas.width, canvas.height);
        // 描画設定を'source-over'に設定する
        context.globalCompositeOperation = 'source-over';
        // マスクを描画
        context.drawImage(mask,
                          canvas.width / 2 - mask_size / 2,
                          canvas.height / 2 - mask_size / 2,
                          mask_size, mask_size);
        // 描画設定を'source-atop'に設定する
        context.globalCompositeOperation = 'source-atop';
        // リンゴを描画する
        context.drawImage(image, 0, 0, canvas.width, canvas.height);
        // マスクサイズを小さくする
        mask_size = mask_size - 4;
        // 再描画を予約
        timer = setTimeout('FadeBlack(' + mask_size + ')', 1000 / frame_rate);
    }
    // マスク画像サイズが０未満の場合
    else {
        // キャンバスをクリアする。(ドットレベルで描画が残るため)
        context.clearRect(0, 0, canvas.width, canvas.height);
    }
}


/**
 * 段々明るくなる処理準備
 */
function initFadeWhite() {
    // マスクの初期サイズを設定する
    initMaskSize = 0;
    // マスクの最大サイズを設定する
    limitSize = Math.sqrt(canvas.width * canvas.width + canvas.height * canvas.height);
    // キャンバス背景を黒に変更する
    $('canvas').css('background-color', '#000');
    // 明るくなっていく処理を実行する
    FadeWhite(initMaskSize, limitSize);
}
/**
 * 段々明るくなる処理
 */
function FadeWhite(mask_size, limit_size) {
    // マスクサイズが最大以下の場合
    if (mask_size <= limit_size) {
        // キャンバスをクリアする
        context.clearRect(0, 0, canvas.width, canvas.height);
        // 描画設定を'source-over'に設定する
        context.globalCompositeOperation = 'source-over';
        // マスクを描画
        context.drawImage(mask,
                          canvas.width / 2 - mask_size / 2,
                          canvas.height / 2 - mask_size / 2,
                          mask_size, mask_size);
        // 描画設定を'source-atop'に設定する
        context.globalCompositeOperation = 'source-atop';
        // リンゴを描画する
        context.drawImage(image, 0, 0, canvas.width, canvas.height);
        // マスクサイズを大きくする
        mask_size = mask_size + 4;
        // 再描画を予約
        timer = setTimeout('FadeWhite(' + mask_size + ',' + limit_size + ')', 1000 / frame_rate);
    }
    // マスク画像サイズが最大を超えてるの場合
    else {
    }
}