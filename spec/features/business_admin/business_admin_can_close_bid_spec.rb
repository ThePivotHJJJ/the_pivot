require "rails_helper"

feature "Business admin can close bid" do
  scenario "a user wins the bid and the item is retired" do
    create_business_admin_and_shop
    admin = User.first
    shop = Shop.first
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item
    logout

    create_registered_user
    user = User.last
    login(user)

    visit shops_path
    click_link shop.name
    click_link item.title
    click_button "Bid"

    logout
    login(admin)

    visit shop_item_path(shop: shop.slug, id: item.id)

    expect(page).to have_link("Close bidding")

    click_link "Close bidding"

    expect(current_path).to eq(shop_item_path(shop: shop.slug, id: item.id))
    expect(page).to have_content("Item #{item.title} has been closed for bidding")
    expect(page).to_not have_link("Bid")
    expect(page).to have_content("This item is closed")
    expect(page).to have_content("Item won for $2.00")
    expect(page).to_not have_link("Close bidding")
  end
end
