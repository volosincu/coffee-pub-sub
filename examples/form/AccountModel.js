/**
 * Created by bvolosincu on 5/27/2014.
 */

var accountModel = {

    name: null,
    surname: null,
    street: null,
    city: null,
    code: null,
    email: null,
    card: null,
    update: function(){

    }
};


var account = new cpubsub(accountModel);

account.attachTo('update', function () {
        this.name = $$('name').value,
        this.surname = $$('surname').value,
        this.street = $$('street').value,
        this.city = $$('city').value,
        this.code = $$('code').value,
        this.email = $$('email').value,
        this.card = $$('card').value;

});

account.attachTo('update', function() {
    var template = $$('template').innerHTML;
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template, account);
    $$('purchase').innerHTML = rendered ;

});


function validate () {
	for(var prop in this){
		if (this.hasOwnProperty(prop)) {
			if(typeof this[prop] !== 'function' && prop !== 'prototype'){
				if(this[prop] === '')console.log("necompletat : " + prop);
			}
		}
	}
}


account.attachTo('update', validate);





