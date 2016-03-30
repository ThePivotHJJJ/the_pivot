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

var $searchBox = $('input[type=text]');
var $items = $('.item');

function match(search, text) {
  var search = search.toUpperCase();
  var text = text.toUpperCase();

  var j = -1;

  for (var i = 0; i < search.length; i++) {
    var l = search[i];

    if (l === '') {
      continue;
    }

    j = text.indexOf(l, j + 1);
    if (j === -1) {
      return false;
    }
  }

  return true;
}

$searchBox.on('keyup', function() {
  var $searchVal = $searchBox.val();

  $items.each(function(i, item) {
    $itemVal = $(item).text();

    if (match($searchVal, $itemVal)) {
      $(item).css('display', 'initial');
    } else {
      $(item).css('display', 'none');
    }
  });
});
