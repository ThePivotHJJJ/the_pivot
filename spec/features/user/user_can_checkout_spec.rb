require "rails_helper"

feature "user can checkout" do
  scenario "they see the login page" do
    user = create(:user)
    login(user)
    shop1 = Shop.create(name: "Gifs for Good")
    item1 = create(:item)
    shop1.items << item1

    visit shops_path

    click_on "Gifs for Good"
    expect(current_path).to eq shop_path(shop: shop1.slug)

    click_on item1.title
    click_on "Add to cart"

    visit cart_path

    click_on "Checkout"

    expect(current_path).to eq new_charge_path
    expect(page).to have_content "Please provide a payment method to continue with your purchase."
  end
end
