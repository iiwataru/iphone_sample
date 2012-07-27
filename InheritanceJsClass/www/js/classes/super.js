var SuperClass; 

(function() {
    SuperClass = function(argument) {
        this.argument = argument;
    };
 
    SuperClass.prototype = {

        callSuperAlert : function() {
            alert("super class : " + this.argument);
        },

        getSuperString : function () {
            return "Super Class String";
        }
    };
})();