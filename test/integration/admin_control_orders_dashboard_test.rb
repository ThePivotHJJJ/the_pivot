require "test_helper"

class AdminControlOrdersDashboardTest < ActionDispatch::IntegrationTest
  test "admin visits dashboard  and clicks to view a list of orders and status totals" do
    create_and_return_admin
    create_multiple_orders(6)
    recent_order = Order.last

    visit admin_dashboard_path
    click_link "View all orders"

    assert page.has_content? ".all_orders for items_for_good"
    assert_equal admin_orders_path, current_path
    assert page.has_content? "Ordered: 6"
    assert page.has_link?(recent_order.id, admin_order_path(recent_order))
  end

  test "admin clicks link for individual order and views it" do
    create_and_return_admin
    create_multiple_orders(6)
    recent_order = Order.last

    visit admin_dashboard_path
    click_link "View all orders"
    assert page.has_link?(recent_order.id, admin_order_path(recent_order))
    click_link(recent_order.id)

    assert_equal admin_order_path(recent_order), current_path
    recent_order.order_items.each do |order_item|
      assert page.has_link?(order_item.item.title)
      assert page.has_css?("img[src='#{order_item.item.image}']")
      assert page.has_content?(order_item.quantity)
      assert page.has_content?(order_item.subtotal)
    end

    assert page.has_content? recent_order.status
    assert page.has_content? recent_order.total_price
    assert page.has_content? recent_order.created_at
    assert page.has_content? recent_order.order_status
    assert page.has_content? recent_order.updated_at
  end

  test "admin filters orders by status type and transitions status" do
    create_and_return_admin
    create_multiple_orders(10)
    recent_order = Order.last

    visit admin_orders_path
    assert page.has_content? "Ordered: 10"
    within "tr:nth-child(3)" do
      click_link "Mark As Paid"
    end

    assert page.has_content? "Ordered: 9"
    assert page.has_content? "Paid: 1"

    within "tr:nth-child(4)" do
      click_link "Cancel"
    end

    refute page.has_content? "Ordered: 9"
    assert page.has_content? "Cancelled: 1"
    assert page.has_content? "Paid: 1"
  end
end
