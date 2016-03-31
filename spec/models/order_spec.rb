require "rails_helper"

describe Order, type: :model do

  it "returns the order status" do
    order1 = Order.create(total_price: 100, status: "completed")
    order2 = Order.create(total_price: 100, status: "cancelled")

    expect(order1.order_status).to eq "Order Complete on #{order1.updated_at}"
    expect(order2.order_status).to eq "Order cancelled on #{order2.updated_at}"
  end

  it "updates the status to paid" do
    order1 = Order.create(total_price: 100, status: "ordered")

    expect(order1.update_status_paid).to eq true
  end
end
