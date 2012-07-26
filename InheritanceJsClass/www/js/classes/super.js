var SuperClass; 

(function() {
    SuperClass = function() {
    };

 
    SuperClass.prototype = {

        callSuperAlert : function() {
            alert("call Super Alert");
        },

        getSuperString : function () {
            return "Super Class String";
        }
    };
})();