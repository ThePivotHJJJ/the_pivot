require "rails_helper"

feature "visitor can view all items" do
  scenario "they see all the items" do
    create_list(:item, 14)

    visit root_path
    click_link "Items"

    expect(current_path).to eq(items_path)

    Item.all.each do |item|
      expect(page).to have_link(item.title)
    end
  end
end
