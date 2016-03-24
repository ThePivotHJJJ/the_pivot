require "rails_helper"

feature "Visitor can add items from multiple shops to their cart" do
  scenario "they see their cart with all the items" do
    shop1 = Shop.create(name: "Gifs for Good")
    item1 = create(:item)
    shop1.items << item1
    shop2 = Shop.create(name: "Feline Friendsy")
    item2 = create(:item)
    shop2.items << item2

    visit shops_path

    click_on "Gifs for Good"
    expect(current_path).to eq shop_path(shop: shop1.slug)

    click_on item1.title
    click_on "Add to cart"

    visit shops_path

    click_on "Feline Friendsy"
    click_on item2.title
    click_on "Add to cart"

    visit cart_path

    expect(page).to have_content(item1.title)
    expect(page).to have_content(item2.title)
    expect(page).to have_link "Checkout"
  end
end
