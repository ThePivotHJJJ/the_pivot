require "test_helper"

class CartTest < ActiveSupport::TestCase
  test "add item to cart increases contents" do
    item_1 = create(:item)
    cart = Cart.new(item_1.id.to_s => 1)

    assert_equal 1, cart.total_items

    item_2 = create(:item)
    cart.add_item(item_2.id)

    item_3 = create(:item)
    cart.add_item(item_3.id)

    assert_equal 3, cart.total_items
  end

  test "add 2 of a item increases count of item" do
    item_1 = create(:item)
    cart = Cart.new(item_1.id.to_s => 1)

    cart.add_item(item_1.id)

    item_2 = create(:item)
    cart.add_item(item_2.id)

    assert_equal 2, cart.cart_items.first.quantity
    assert_equal 3, cart.total_items
  end

  test "remove_item removes item from cart" do
    item_1 = create(:item)
    cart = Cart.new(item_1.id.to_s => 1)

    item_2 = create(:item)
    cart.add_item(item_2.id)

    assert_equal 2, cart.total_items

    cart.remove_item(item_2.id)

    assert_equal 1, cart.total_items
  end

  test "cartitems method returns cartitem objects" do
    item_1 = create(:item)
    item_2 = create(:item)
    cart = Cart.new(item_1.id.to_s => 1)

    cart.add_item(item_2.id)

    assert_equal Cartitem, cart.cart_items.first.class
    assert_equal 2, cart.cart_items.count
  end

  test "total price returns total price in cents" do
    item_1 = create(:item)
    cart = Cart.new(item_1.id.to_s => 1)

    cart.add_item(item_1.id)

    item_2 = create(:item)
    cart.add_item(item_2.id)

    assert_equal 300, cart.total_price
  end
end
