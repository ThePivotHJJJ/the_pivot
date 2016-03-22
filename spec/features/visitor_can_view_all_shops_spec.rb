require "rails_helper"

feature "Visitor can view all shops" do
  scenario "they see all the shops" do
    create_list(:shop, 8)
    visit "/"

    click_on "All Shops"

    expect(current_path).to eq(shops_path)
    expect(page).to have_content("All Shops")

    within('div#shop-list') do
      expect(page).to have_css("#shop", count: 8)
    end
    
    Shop.all.each do | shop |
      expect(page).to have_content(shop.name)
      expect(page).to have_link(shop.name)
    end
  end
end
