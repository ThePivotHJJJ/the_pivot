class CartItem < SimpleDelegator
  attr_reader :quantity

  def initialize(item_id, quantity)
    @item = Item.find(item_id)
    @quantity = quantity
    super(@item)
  end

  def subtotal
    quantity * price.to_f / 100
  end
end
