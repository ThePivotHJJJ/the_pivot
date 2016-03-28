require "rails_helper"

feature "visitor must sign in to bid" do
  scenario "they see the login page" do
    shop = Shop.create(name: "Gifs for Good")
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item

    visit shops_path
    click_link shop.name
    click_link item.title
    click_button "Bid"

    expect(current_path).to eq login_path
    expect(page).to have_button "Login"
    expect(page).to have_link "Haven't Registered? Sign up here!"
  end
end
