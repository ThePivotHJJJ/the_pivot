require "rails_helper"

describe CartItem, type: :model do
  
  it "should calculate the subtotal" do
    item = Item.create(
      title: "Collector Item",
      description: "This is a collector item",
      price: 400
    )
    cart_item = CartItem.new(item.id, 3)

    subtotal = cart_item.subtotal

    expect(subtotal).to eq(12.00)
  end
end
