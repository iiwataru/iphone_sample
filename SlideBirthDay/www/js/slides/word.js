var Word; 

(function() {
    Word = function(point_x, point_y, size_w, size_h) {

        this.point_x = point_x; // 画像が描画されるx座標
        this.point_y = point_y; // 画像が描画されるy座標
        this.size_w = size_w; // 画像のwidthサイズ
        this.size_h = size_h; // 画像のheightサイズ
        this.scale = 0; // 画像の拡大縮小倍率
        this.alpha = 1.0; // 画像の透明度
        this.isExpansion = true; // 画像を拡大するかどうかのフラグ
        this.enable = true; // 画像の生存確認フラグ
        this.probation = 60; // 画像の消去開始までの表示時間
        this.isBeatUp = false; // 鼓動のように画像を拡大するか
        this.frame_cnt = 0;
    };

 
    Word.prototype = {

        /**
         * 拡大縮小倍率の取得処理
         */
        getScale : function() {

            // 拡大していく場合
            if (this.isExpansion) {
                // 拡大縮小倍率を増やす
                this.scale += 0.05;
                // 最大まで拡大しきった場合
                if (this.scale >= 1.0) {
                    this.isExpansion = false;
                }
                // 拡大縮小倍率を返す
                return this.scale;
            }
            // 拡大しきってる場合
            else {
                if (this.probation <= 0) {
                    // 透明度を上げる
                    this.alpha -= 0.1
                    // 画像が完全に透明になった場合
                    if (this.alpha <= 0.5) {
                        // 生存確認フラグをfalseに設定
                        this.enable = false;
                    }
                } else {
                    this.probation--;
                }
                // 拡大縮小倍率を返す
                return this.scale;
            }
        },
 
        /**
         * 鼓動のように動く文字処理
         */
        getBeatScale : function() {
            // 拡大していく場合
            if (this.isExpansion) {
                // 拡大縮小倍率を増やす
                this.scale += 0.1;
                // 最大まで拡大しきった場合
                if (this.scale >= 1.0) {
                    this.isExpansion = false;
                }
            } else {
                // 消去開始している場合
                if (this.probation <= 0) {
                    // 表示倍率を下げる
                    this.scale -= 0.1;
                    // 表示倍率が0以下(表示しない)の場合
                    if (this.scale <= 0.0) {
                        this.enable = false;
                        return false;
                    }
                }
                // 消去開始していない場合
                else {
                    if (this.frame_cnt % 5 == 0) {
                        // isBeatUpがtrueの場合
                        if (this.isBeatUp) {
                            this.scale += 0.1;
                            if (this.scale >= 1.0) { this.isBeatUp = false; }
                        } else {
                            this.scale -= 0.1;
                            if (this.scale <= 9.7) { this.isBeatUp = true; }
                        }
                    }
                    this.frame_cnt = this.frame_cnt % 5 + 1;
                    // 消去開始までの猶予時間を減少させる
                    this.probation--;
                }
            }
            return this.scale;
        }
    };
})();