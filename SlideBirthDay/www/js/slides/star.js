var Star; 

(function() {
    Star = function(point_x, point_y, size_w, size_h) {
        this.point_x = point_x; // 画像が描画されるx座標
        this.point_y = point_y; // 画像が描画されるy座標
        this.size_w = size_w; // 画像のwidthサイズ
        this.size_h = size_h; // 画像のheightサイズ
        this.angle = 0; // 画像の回転角度
        this.speed = 40; // 画像の回転スピード
        this.alpha = 1.0; // 画像の透明度
        this.enable = true; // 画像の生存確認フラグ
    };

 
    Star.prototype = {

        /**
         * 回転角度の取得処理
         */
        getAngle : function() {

            // 回転がまだ回転する場合
            if (this.speed > 0) {
                // 回転角度に回転スピードを代入
                this.angle += this.speed;
                // 回転スピードを減らす
                this.speed -= 0.2; 

                // 回転スピードが15以下の場合
                if (this.speed <= 15) {
                    // 透明度を上げる
                    this.alpha -= 0.05;
                }
                // 回転角度を返す
                return this.angle;
            }
            // 画像がもう回転しない場合
            else {
                // 生存確認フラグをfalse
                this.enable = false;
                // false を返す
                return false;
            }
        }
    };
})();