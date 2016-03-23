require "test_helper"

class UserCanViewAPastOrderTest < ActionDispatch::IntegrationTest
  test "user sees details about their order" do
    user = User.create(username: "Jade", password: "passsword")
    item = create(:item)
    order = user.orders.create(total_price: 100)
    order_item = order.order_items.create(
      item_id: item.id, quantity: 1, subtotal: 100
    )

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/orders"

    assert page.has_link?("order_#{order.id}")

    click_on "order_#{order.id}"

    assert_equal "/orders/#{order.id}", current_path

    order.order_items.each do |order_item|
      assert page.has_link?(order_item.item.title)
      assert page.has_css?("img[src='#{order_item.item.image}']")
      assert page.has_content?(order_item.quantity)
      assert page.has_content?("$1.00")
    end

    assert page.has_content? order.status
    assert page.has_content? "$1.00"
    assert page.has_content? order.created_at
    assert page.has_content? order.order_status
    assert page.has_content? order.updated_at
  end
end
