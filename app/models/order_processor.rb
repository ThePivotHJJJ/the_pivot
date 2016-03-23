class OrderProcessor
  attr_reader :cart,
              :cart_items,
              :user

  def initialize(cart, user)
    @cart = cart
    @cart_items = cart.cart_items
    @user = user
  end

  def process_order
    order = user.orders.create(total_price: cart.total_price, status: 0)
    cart_items.each do | cart_item |
      order.order_items.create(item_id: cart_item.id, quantity: cart_item.quantity, subtotal: cart_item.subtotal)
    end
    order
  end
end
