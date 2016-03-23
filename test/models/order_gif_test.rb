require 'test_helper'

class OrderitemTest < ActiveSupport::TestCase
  should validate_presence_of(:quantity)
  should validate_presence_of(:subtotal)
  should belong_to(:order)
  should belong_to(:item)
end
