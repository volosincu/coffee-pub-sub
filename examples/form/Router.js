/**
 * Created by bvolosincu on 5/28/2014.
 */



var $$ = function(param) {
    return document.getElementById(param);
};


window.addEventListener("load", function() {


    for (var index in $$('form-fields').childNodes){
        var nodeChild = $$('form-fields').childNodes[index];
        if(nodeChild.nodeType === 1) {
            var inputField = nodeChild.childNodes[1];

            inputField.addEventListener( 'blur', function(){
                account.update();
            });

            inputField.addEventListener( 'keypress', function(){
                account.update();
            });
        }
    }



});




