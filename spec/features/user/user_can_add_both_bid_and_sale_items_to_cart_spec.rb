require "rails_helper"

feature "Registered user can add both bid and sale items to their cart" do
  scenario "they see both items in their cart" do
    create_roles
    create_registered_user
    create_business_admin_and_shop
    create_shop_item
    admin = User.find_by(username: "Brock")
    logout
    user = User.find_by(username: "Misty")
    login(user)

    shop = Shop.create(name: "Gifs for Good")
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item

    user_wins_bid(user, admin, shop, item)
    click_on "Won"

    visit root_path
    click_on "Shops"
    click_on "Double J's Yummy Snack Party"
    click_on "all of teh lulz"
    click_on "Buy it now"
    click_on "Cart"

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content("$2.00")
    expect(page).to have_content("all of teh lulz")
    expect(page).to have_content("this is all the lulz you could imagine!!")
  end
end
