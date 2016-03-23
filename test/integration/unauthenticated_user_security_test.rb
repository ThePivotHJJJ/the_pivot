require 'test_helper'

class UnauthenticatedUserSecurityTest < ActionDispatch::IntegrationTest
  test "visitor cannot see other users' orders" do
    user1 = create(:user)
    item1 = create(:item)
    order1 = user1.orders.create(total_price: 100)
    order_item1 = order1.order_items.create(
      item_id: item1.id, quantity: 1, subtotal: 100
    )

    visit "/orders"

    refute page.has_content? "order_#{order1.id}"
    assert page.has_content? "The page you were looking for doesn't exist"
  end

  test "visitor redirected to login when trying to check out" do
    item = create(:item)
    visit item_path(item)
    click_link "Add to cart"
    visit "/cart"
    click_on "Checkout"

    assert_equal login_path, current_path
  end

  test "visitor cannot see admin dashboard" do
    visit "/admin/dashboard"

    refute page.has_content? "Admin Dashboard"
    assert page.has_content? "The page you were looking for doesn't exist"
  end

  test "visitor cannot make self admin" do
    visit "/users/new"

    refute page.has_content? "Role"
  end
end
