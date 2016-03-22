require "rails_helper"

feature "visitor can view all items" do
  scenario "they see all the items" do

    Item.create!(name: "cat")
    Item.create!(name: "snake")

    visit root_path

    click_on "Items"

    within('div#item-list') do
      expect page.has_content? "cat"
      expect page.has_content? "snake"
      expect page.should have_css("#item", count: 2)
    end
  end
end  