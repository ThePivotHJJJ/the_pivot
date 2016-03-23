require "test_helper"

class itemTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:description)
  should validate_presence_of(:price)
  should validate_numericality_of(:price).
    is_greater_than(0)
  should validate_presence_of(:image)
  should have_many(:tags).through(:item_tags)

  test "retired is default false" do
    item = create(:item)

    assert_equal false, item.retired
  end
end
