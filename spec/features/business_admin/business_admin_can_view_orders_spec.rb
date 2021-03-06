require "rails_helper"

feature "business admin can view orders" do
  scenario "they see the orders table" do
    create_roles
    create_business_admin_and_shop
    create_multiple_orders(6)

    order = Order.last

    visit admin_dashboard_path
    click_link "View all orders"

    expect(current_path).to eq admin_orders_path
    expect(page).to have_content "All Orders for Double J's Yummy Snack Party"
    expect(page).to have_link "#{order.id}"
    expect(page).to have_content "#{order.status}"
  end
end
