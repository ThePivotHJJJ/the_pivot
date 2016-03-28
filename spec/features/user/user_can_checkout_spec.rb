require "rails_helper"

feature "user can checkout" do
  scenario "they see the checkout page" do
    create_roles
    create_registered_user

    shop1 = Shop.create(name: "Gifs for Good")
    item1 = create(:item)
    shop1.items << item1

    user = User.find_by(username: "Misty")
    login(user)

    visit shops_path

    click_on "Gifs for Good"
    expect(current_path).to eq shop_path(shop: shop1.slug)

    click_on item1.title
    click_on "Buy it now"

    visit cart_path

    click_on "Checkout"

    expect(current_path).to eq new_charge_path
    expect(page).to have_content "Please provide a payment method to continue with your purchase."
  end
end
