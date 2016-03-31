class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def remove_item(item_id)
    contents.reject! { |id| id == item_id.to_s }
  end

  def cart_items
    contents.map do |item_id, quantity|
      CartItem.new(item_id, quantity)
    end
  end

  def total_price
    prices = cart_items.map do |cart_item|
      (cart_item.quantity * cart_item.price)
    end
    prices.reduce(:+)
  end
end
