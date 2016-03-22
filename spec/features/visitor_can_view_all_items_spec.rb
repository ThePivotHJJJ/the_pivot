require "rails_helper"

feature "visitor can view all items" do
  scenario "they see all the items" do

    create_list(:item, 14)

    visit root_path

    click_link "All Items"

    expect(current_path).to eq(items_path)

    within('div#item-list') do
      expect page.should have_css("#item", count: 14)
    end

    Item.all.each do |item|
      expect(page).to have_content(item.name)
      expect(page).to have_link(item.name)
    end
  end
end  