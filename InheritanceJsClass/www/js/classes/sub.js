var SubClass; 

(function() {
    SubClass = function(argument1,argument2) {
        SuperClass.call(this,argument1);
        this.argument2 = argument2;
    };

    // これで継承する！！
    SubClass.prototype = new SuperClass();

    // 継承したらメソッドの書き方を変える(上書きしてしまって継承した内容がきえてしまう！)
    SubClass.prototype.callSubAlert = function() {
            alert("sub class : " + this.argument2);
            //alert("call Sub Alert");
    };
})();