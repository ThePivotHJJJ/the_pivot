require "rails_helper"

feature "user can view bid statuses" do
  scenario "they see that they won" do
    create_business_admin_and_shop
    admin = User.first
    create_item_for_shop
    create_registered_user
    user = User.last
    login(user)
    shop = Shop.first
    item = Item.first

    user_wins_bid(user, admin, shop, item)

    within(".status-#{item.id}") do
      expect(page).to have_content "Won"
      expect(page).to_not have_content "Lost"
      expect(page).to_not have_content "Open"
    end
  end

  scenario "they see that they lost" do
    create_business_admin_and_shop
    admin = User.first
    create_item_for_shop
    create_registered_user
    user = User.last
    login(user)
    shop = Shop.first
    item = Item.first

    visit root_path
    click_link "Shops"
    click_link shop.name
    click_link item.title
    click_button "Bid"
    logout


    create_second_user
    user2 = User.find_by(username: "Ash")
    login(user2)
    user_wins_bid(user2, admin, shop, item)
    logout

    login(user)

    click_on "My Bids"

    within(".status-#{item.id}") do
      expect(page).to have_content "Lost"
      expect(page).to_not have_content "Won"
      expect(page).to_not have_content "Open"
    end
  end

  scenario "they see that it's open" do
    create_business_admin_and_shop
    admin = User.first
    create_item_for_shop
    create_registered_user
    user = User.last
    login(user)
    shop = Shop.first
    item = Item.first

    visit root_path
    click_link "Shops"
    click_link shop.name
    click_link item.title
    click_button "Bid"

    click_on "My Profile"
    click_on "My Bids"

    within(".status-#{item.id}") do
      expect(page).to have_content "Open"
      expect(page).to_not have_content "Lost"
      expect(page).to_not have_content "Won"
    end
  end
end
