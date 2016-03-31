'use strict';
var doc = document;

var bid = doc.getElementById('item_bid_true');
var buyItNow = doc.getElementById('item_bid_false');
var price = doc.querySelector('label[for=item_price]');

function changeText(el, text) {
  el.innerHTML = text;
}

bid.addEventListener('change', function() {
  changeText(price, "Starting Bid");
}, false);

buyItNow.addEventListener('change', function() {
  changeText(price, "Price");
}, false);
