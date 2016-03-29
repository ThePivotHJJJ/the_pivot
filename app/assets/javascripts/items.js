$bid = $('#item_bid_true');
$buyItNow = $('#item_bid_false');
$price = $('label[for=item_price]');

$bid.on('change', function () {
  $price.html('Starting Bid');
});

$buyItNow.on('change', function () {
  $price.html('Price');
});
