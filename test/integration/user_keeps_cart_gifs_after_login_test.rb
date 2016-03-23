require "test_helper"

class UserKeepsCartitemsAfterLoginTest < ActionDispatch::IntegrationTest
  test "user sees cart quantity remain after login" do
    item = create(:item)
    item2 = create(:item)

    visit item_path(item)
    click_link "Add to cart"

    visit item_path(item2)
    click_link "Add to cart"

    assert page.has_content?("cart(2)")

    create_and_login_user

    visit '/cart'
    assert page.has_content?("cart(2)")
  end
end
