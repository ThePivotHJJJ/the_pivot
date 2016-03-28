require "rails_helper"

feature "Registered user can place a bid on an item" do
  scenario "they see a message that they have successfully placed a bid" do
    user = FactoryGirl.create(:user)
    login(user)
    shop = Shop.create(name: "Gifs for Good")
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item

    visit shops_path
    click_link shop.name
    click_link item.title
    click_button "Bid"

    expect(current_path).to eq("/#{shop.slug}/items/#{item.id}")
    expect(page).to have_content("Placed a bid for $2.00 on #{item.title}")
  end
end
