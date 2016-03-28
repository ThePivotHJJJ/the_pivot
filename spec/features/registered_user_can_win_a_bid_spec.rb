require "rails_helper"

feature "Registered user can win a bid" do
  scenario "they see that they have won the bid" do
    create_business_admin_and_shop
    admin = User.first
    create_item_for_shop
    user = FactoryGirl.create(:user)
    login(user)
    shop = Shop.first
    item = Item.first

    visit root_path
    click_link "Shops"
    click_link shop.name
    click_link item.title
    click_button "Bid"
    close_bid(admin, shop, item)
    login(user)
    click_link "My Profile"
    click_link "Active Bids"

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content("$2.00")
    expect(page).to have_content("Status")
    expect(page).to have_link("Won")
  end
end
