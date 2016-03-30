require "rails_helper"

feature "visitor can remove item from cart" do
  scenario "they don't see the removed item" do
    shop = Shop.create(name: "Gifs for Good")
    item = create(:item)
    shop.items << item

    visit root_path
    click_on "Shops"
    click_on "Gifs for Good"

    expect(current_path).to eq shop_path(shop: shop.slug)

    click_on item.title
    click_on "Buy it now"

    click_on "Cart"

    click_link("Remove")

    expect(page).to_not have_content item.description
    expect(page).to have_content "Successfully removed item from cart"
  end
end
