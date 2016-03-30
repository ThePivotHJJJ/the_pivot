require "rails_helper"

feature "user receives email when bid is won" do
  scenario "admin sees flash that user was sent email" do
    create_business_admin_and_shop
    admin = User.first
    create_item_for_shop
    create_registered_user
    user = User.last
    shop = Shop.first
    item = Item.first
    login(user)

    visit root_path
    click_link "Shops"
    click_link shop.name
    click_link item.title
    click_button "Bid"
    logout

    login(admin)
    visit shop_item_path(shop: shop.slug, id: item.id)
    click_link "Close bidding"

    expect(page).to have_content "Email sent to #{user.email} to notify #{user.username} that they've won their bid!"
  end
end
