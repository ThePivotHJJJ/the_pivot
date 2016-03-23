require 'test_helper'

class AdminCanUpdateAitemTest < ActionDispatch::IntegrationTest
  test "admin sees item with updated title" do
    create_and_return_admin
    item = create(:item, title: "Keri's item")

    visit item_path(item.id)

    click_on "Edit"

    fill_in "Title", with: "Boulder Creek!"
    fill_in "Description", with: "this is all the lulz you could imagine!!"
    fill_in "Price", with: "100"
    fill_in "Tags", with: "lulzy, defeated, dusty"
    attach_file "Image", "test/asset_tests/items/carmer-got-carmed.item"

    click_on "Update item"

    assert page.has_content? "Boulder Creek!"
    refute page.has_content? "Keri's item"
  end

  test "admin can retire a item and still see it" do
    create_and_return_admin
    item = create(:item, title: "Da bomb")

    visit item_path(item.id)

    click_on "Edit"

    fill_in "Title", with: "Boulder Creek!"
    fill_in "Description", with: "this is all the lulz you could imagine!!"
    fill_in "Price", with: "100"
    fill_in "Tags", with: "lulzy, defeated, dusty"
    attach_file "Image", "test/asset_tests/items/carmer-got-carmed.item"

  end
end
