require "rails_helper"

feature "Registered user can view My Bids" do
  scenario "they see their My Bids" do
    create_roles
    create_registered_user
    user = User.find_by(username: "Misty")
    login(user)

    shop = Shop.create(name: "Gifs for Good")
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item

    visit shops_path
    click_link shop.name
    click_link item.title
    click_button "Bid"
    click_link "My Profile"
    click_link "My Bids"

    expect(current_path).to eq("/dashboard/bids")
    expect(page).to have_link(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content("My Bid")
    expect(page).to have_content("$2.00")
    expect(page).to have_content("Current Bid")
  end
end
