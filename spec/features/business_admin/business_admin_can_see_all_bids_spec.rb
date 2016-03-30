require "rails_helper"

feature "business admin can see all bids and close them" do
  scenario "they see a list of bids for their items and can close them" do
    create_business_admin_and_shop
    admin = User.find_by(username: "Brock")
    create_item_for_shop
    login(admin)
    create_item_for_shop
    item1 = Item.first
    item2 = Item.last
    shop = Shop.first

    create_registered_user
    user = User.find_by(username: "Misty")
    login(user)

    visit root_path
    click_link "Shops"
    click_link shop.name
    click_link item1.title
    click_button "Bid"

    click_link "Shops"
    click_link shop.name
    click_link item2.title
    click_button "Bid"

    logout

    close_bid(admin, shop, item2)

    login(admin)
    click_on "My Profile"
    click_on "View all bids"

    expect(current_path).to eq admin_bids_path

    within(".status-#{item1.id}") do
      expect(page).to have_content "Open"
      expect(page).to_not have_content "Closed"
    end

    within(".status-#{item2.id}") do
      expect(page).to have_content "Closed"
      expect(page).to_not have_content "Open"
    end

    expect(page).to have_content item1.title
    expect(page).to have_content item1.description
    expect(page).to have_content "Misty"
  end
end
