/**
 * Created by bvolosincu on 5/28/2014.
 */



var $$ = function(param) {
    return document.getElementById(param);
};


window.addEventListener("load", function() {

    $$('name').addEventListener( 'keypress', function(){
        account.update();
    });

    $$('surname').addEventListener( 'keypress', function(){
        account.update();
    });

    $$('street').addEventListener( 'keypress', function(){
        account.update();
    });

    $$('city').addEventListener( 'keypress', function(){
        account.update();
    });

    $$('code').addEventListener( 'keypress', function(){
        account.update();
    });

    $$('email').addEventListener( 'keypress', function(){
        account.update();
    });

    $$('card').addEventListener( 'keypress', function(){
        account.update();
    });

    $$('name').addEventListener( 'keypress', function(){
        console.log("sasa");
    });


});
