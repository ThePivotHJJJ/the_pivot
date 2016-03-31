require "rails_helper"

feature "business admin can update shop item" do
  scenario "they see the updated shop item" do
    create_business_admin_and_shop
    create_shop_item
    item = Item.find_by(title: "all of teh lulz")

    visit shop_item_path(shop: item.shop.slug, id: item.id)

    click_on "Edit"

    fill_in "Title", with: "Bunnies"
    click_on "Update item"

    expect(page).to have_content "Bunnies"
    expect(page).to_not have_content "all of teh lulz"
  end

  scenario "invalid item input" do
    create_business_admin_and_shop
    create_shop_item
    item = Item.find_by(title: "all of teh lulz")

    visit shop_item_path(shop: item.shop.slug, id: item.id)

    click_on "Edit"

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_on "Update item"

    expect(page).to have_content "Invalid input"
  end
end
