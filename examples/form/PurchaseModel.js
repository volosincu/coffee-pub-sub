/**
 * Created by bvolosincu on 5/27/2014.
 */

var purchaseModel = {

    purchase_owner: null,
    purchase_address: null,
    purchase_city: null,
    purchase_phone: null,
    update: function(){}

};


var purchase = new Proto(purchaseModel);


purchase.attachTo('update', function(){

    this.name = $$('name').value,
    this.surname = $$('surname').value,
    this.street = $$('street').value,
    this.city = $$('city').value,
    this.code = $$('code').value,
    this.email = $$('email').value,
    this.card = $$('card').value;
});
