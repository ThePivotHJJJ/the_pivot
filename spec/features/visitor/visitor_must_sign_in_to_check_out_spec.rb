require "rails_helper"

feature "visitor must sign in to check out" do
  scenario "they see the login page" do
    shop1 = Shop.create(name: "Gifs for Good")
    item1 = create(:item)
    shop1.items << item1

    visit shops_path

    click_on "Gifs for Good"
    expect(current_path).to eq shop_path(shop: shop1.slug)

    click_on item1.title
    click_on "Buy it now"

    visit cart_path

    click_on "Checkout"

    expect(current_path).to eq login_path
    expect(page).to have_button "Login"
    expect(page).to have_link "Haven't Registered? Sign up here!"
  end
end
