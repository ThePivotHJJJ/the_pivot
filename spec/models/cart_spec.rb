require "rails_helper"

describe Cart, type: :model do

  before(:each) do
    @cart = Cart.new({ "1" => 1, "2" => 2 })
  end

  it "can add an item" do
    @cart.add_item(3)

    expect(@cart.contents).to eq({ "1" => 1, "2" => 2, "3" => 1 })
  end

  it "can remove an item" do
    @cart.remove_item(1)

    expect(@cart.contents).to eq({ "2" => 2 })
  end

end
