require "rails_helper"

feature "visitor can increase quantity of buy it now" do
  scenario "visitor sees new quantity" do
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

    expect(current_path).to eq cart_path

    within page.all("tr")[1] do
      expect(page).to have_content item.title
      expect(page).to have_content "$1.00"
    end

    select(2)
    click_on "Update"

    expect(current_path).to eq cart_path

    within page.all("tr")[1] do
      expect(page).to have_content "2"
      expect(page).to have_content "$2.00"
    end
    assert page.has_content?("Total: $2.00")
  end
end
