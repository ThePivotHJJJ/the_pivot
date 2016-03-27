require "rails_helper"

feature "business admin can view order info" do
  scenario "they see the order info table" do
    create_business_admin_and_shop
    create_multiple_orders(6)

    recent_order = Order.last

    visit admin_dashboard_path
    click_link "View all orders"
    click_link(recent_order.id)

    expect(page).to have_content recent_order.status
    expect(page).to have_content recent_order.total_price
    expect(page).to have_content recent_order.created_at
    expect(page).to have_content recent_order.order_status
    expect(page).to have_content recent_order.updated_at
    expect(page).to have_content recent_order.user.username
  end
end
