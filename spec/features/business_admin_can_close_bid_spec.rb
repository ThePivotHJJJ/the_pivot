require "rails_helper"

feature "Business admin can close bid" do
  scenario "a user wins the bid and the item is retired" do
    create_business_admin_and_shop
    admin = User.first
    shop = Shop.first
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item
    logout(admin)

    user = FactoryGirl.create(:user)
    login(user)

    visit shops_path
    click_link shop.name
    click_link item.title
    click_link "Bid"

    logout(user)
    login(admin)

    visit shop_item_path(shop: shop.slug, id: item.id)

    expect(page).to have_link("Close bidding")

    click_link "Close bidding"

    expect(current_path).to eq(shop_item_path(shop: shop.slug, id: item.id))
    expect(page).to have_content("Item #{item.title} has been closed for bidding")
    expect(page).to_not have_link("Bid")
    expect(page).to have_content("This item is closed")
    expect(page).to have_content("Item won for #{item.price}")

    # ...continue with the mechanics for closing out a bid
  end
end
