require "rails_helper"

feature "visitor can view all items" do
  scenario "they see all the items" do
    shop1 = Shop.create(name: "Gifs for Good")
    item1 = create(:item)
    shop1.items << item1
    shop2 = Shop.create(name: "Feline Friendsy")
    item2 = create(:item)
    shop2.items << item2
    
    visit root_path
    click_link "Items"

    expect(current_path).to eq(items_path)

    Item.all.each do |item|
      expect(page).to have_link(item.title)
    end
  end
end
