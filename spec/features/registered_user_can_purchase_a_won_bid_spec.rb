require "rails_helper"

feature "Registered user can purchase a won bid" do
  scenario "they see the order in their orders" do
    create_business_admin_and_shop
    admin = User.first
    create_item_for_shop
    create_registered_user
    user = User.last
    login(user)
    shop = Shop.first
    item = Item.first

    user_wins_bid(user, admin, shop, item)
    click_link "Won"
    click_link "Cart"

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content("$2.00")

    click_link "Checkout"

    expect(current_path).to eq(new_charge_path)
    expect(page).to have_content("Please provide a payment method to continue with your purchase.")
  end
end
