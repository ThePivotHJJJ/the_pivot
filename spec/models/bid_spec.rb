require 'rails_helper'

RSpec.describe Bid, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:item) }
  
  it { should validate_presence_of :bid_price }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :item_id }
end
