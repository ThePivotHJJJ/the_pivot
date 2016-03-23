require "rails_helper"

feature "Visitor can view a single item" do
  scenario "they see an item and associated info" do

    create_list(:item, 20)
    item = Item.last
    visit items_path

    expect(page).to have_link(item.name)

    click_link item.name

    expect(current_path).to eq(item_path(item))
    expect(page).to have_content(item.name)

    within("div.item") do
      expect(page).to have_content(item.description)
      expect(page).to have_css("img[src='#{item.image}']")
    end
  end
end
