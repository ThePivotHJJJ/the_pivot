var doc = document;
var bid = doc.getElementById('item_bid_true');
var buyItNow = doc.getElementById('item_bid_false');
var price = doc.querySelector('label[for=item_price]');

bid.addEventListener('change', function() {
  price.innerHTML = "Starting Bid";
}, false);

buyItNow.addEventListener('change', function() {
  price.innerHTML = "Price";
}, false);
