require "test_helper"

class VisitorViewsAllitemsTest < ActionDispatch::IntegrationTest
  test "visitor sees all items" do
    item1 = create(:item)
    item1.tags.find_or_create_by(name: "faves")

    visit items_path

    assert page.has_css?("img[src='#{item1.image.url}']")
  end
end
