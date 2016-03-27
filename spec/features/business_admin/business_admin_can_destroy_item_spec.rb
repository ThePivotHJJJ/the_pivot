require "rails_helper"

feature "business admin can destroy shop item" do
  scenario "they see the updated shop item" do
    create_business_admin_and_shop
    create_shop_item
    item = Item.find_by(title: "all of teh lulz")

    visit shop_item_path(shop: item.shop.slug, id: item.id)

    click_on "Delete"

    expect(current_path).to eq root_path
    expect(page).to_not have_content "all of teh lulz"
  end
end
