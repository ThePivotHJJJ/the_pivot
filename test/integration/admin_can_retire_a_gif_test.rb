require 'test_helper'

class AdminCanRetireAitemTest < ActionDispatch::IntegrationTest
  test "admin can no longer find retired item in item index" do
    create_and_return_admin

    item2 = create(:item, title: "Lions")
    item = create(:item, title: "Geckos")

    visit item_path(item.id)
    click_on "Edit"

    click_on "Retire this item"

    refute page.has_content? "Add to cart"

    visit items_path
    refute page.has_content? item.title
  end
end
