/**
 * 定数と変数を宣言
 */


/**
 * htmlの読み込み終了時処理
 */
function didLoadHtml() {

    // SubClassはSuperClassを継承している
    var subClass = new SubClass("hello","good morning");
    // subClassが持っているメソッドを呼び出す
    subClass.callSubAlert();
    // subClassが継承した親クラスのメソッドを呼び出す
    subClass.callSuperAlert();
}