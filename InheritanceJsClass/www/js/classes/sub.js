var SubClass; 

(function() {
    SubClass = function() {
    };

    // これで継承する！！！
    SubClass.prototype = new SuperClass();

    // 継承したらメソッドの書き方を変える(上書きしてしまって継承した内容がきえてしまう！)
    SubClass.prototype.callSubAlert = function() {
            alert("call Sub Alert");
    };
})();