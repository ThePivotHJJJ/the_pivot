'use strict';
const doc = document;

let bid = doc.getElementById('item_bid_true');
let buyItNow = doc.getElementById('item_bid_false');
let price = doc.querySelector('label[for=item_price]');

function changeText(el, text) {
  el.innerHTML = text;
}

bid.addEventListener('change', function() {
  changeText(price, "Starting Bid");
}, false);

buyItNow.addEventListener('change', function() {
  changeText(price, "Price");
}, false);
