require "rails_helper"

feature "business admin can update order" do
  scenario "they see the updated order status" do
    create_business_admin_and_shop
    create_multiple_orders(10)
    recent_order = Order.last

    visit admin_orders_path

    within "tr:nth-child(3)" do
      expect(page).to have_content "ordered"
      click_link "Mark As Paid"
    end
    
    expect(page).to have_content "You have successfully updated Order"

    within "tr:nth-child(4)" do
      expect(page).to have_content "ordered"
      click_link "Cancel"
    end

    expect(page).to have_content "You have successfully updated Order"
  end
end
