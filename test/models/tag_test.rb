require "test_helper"

class TagTest < ActiveSupport::TestCase
  should have_many(:items).through(:item_tags)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
end
