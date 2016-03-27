require "rails_helper"

feature "Business admin can create an item as a bid" do
  scenario "they see the newely created item" do
    create_business_admin_and_shop

    visit admin_dashboard
    click_link "Create Bid Item"
    fill_in "Title",       with: "Disasterous Party Planning Inc."
    fill_in "Description", with: "When you need to throw an absolutely terrible party!"
    fill_in "Price",       with: 300
    fill_in "Tags",        with: "Party, Disaster, Planning"
    attach_file "Image", "spec/assets/singer-reimagined-porsche-911.jpg"
    click_button "add new item!"

    item = Item.last

    expect(current_path).to eq("/double-j-s-yummy-snack-party/items/#{item.id}")
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    item.tags.each do |tag|
      expect(page).to have_link(tag)
    end
    expect(page).to have_content(item.price)
    expect(page).to have_xpath("//img[@src = 'spec/assets/singer-reimagined-porsche-911.jpg']")
    expect(page).to have_button("Bid")
    expect(page).to_not have_buttom("Buy it now")
  end
end
