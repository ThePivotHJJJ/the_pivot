require "rails_helper"

feature "business admin sees bid history on item show" do
  scenario "business admin sees all bids made on item" do
    create_business_admin_and_shop
    admin = User.find_by(username: "Brock")
    logout
    create_registered_user
    user = User.find_by(username: "Misty")
    login(user)

    shop = Shop.create(name: "Gifs for Good")
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item

    visit shops_path
    click_link shop.name
    click_link item.title
    click_button "Bid"

    logout

    create_second_user
    user2 = User.find_by(username: "Ash")
    login(user2)

    visit shops_path
    click_link shop.name
    click_link item.title
    click_button "Bid"
    logout

    login(admin)

    visit shop_item_path(shop: item.shop.slug, id: item.id)
    expect(page).to have_content user.username
    expect(page).to have_content user2.username
  end
end
