require 'rails_helper'

RSpec.describe Item, type: :model do
  it "calculates the max bid" do
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item)
    bid1 = Bid.create(bid_price: 200, user_id: user.id, item_id: item.id)
    bid2 = Bid.create(bid_price: 600, user_id: user.id, item_id: item.id)
    bid3 = Bid.create(bid_price: 900, user_id: user.id, item_id: item.id)
    item.bids << [bid1, bid2, bid3]

    max_bid = item.max_bid

    expect(max_bid).to eq(900)
  end
end
