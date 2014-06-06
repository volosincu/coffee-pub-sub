/**
 * Created by bvolosincu on 5/28/2014.
 */



var $$ = function(param) {
    return document.getElementById(param);
};


window.addEventListener("load", function() {

    $$('submit').addEventListener( 'click', function(){
        console.log(account);
        account.update();

    });


});
