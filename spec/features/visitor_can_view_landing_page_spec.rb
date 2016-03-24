require "rails_helper"

feature "Visitor can view landing page" do
  scenario "they see the appropriate links for a visitor" do
    visit root_path

    expect(page).to have_link("PABOI")
    expect(page).to have_content("( Put A Bid On It! )")
    expect(page).to have_link("Items")
    expect(page).to have_link("Shops")
    expect(page).to have_link("Sell on PABOI")
    expect(page).to have_link("Register")
    expect(page).to have_link("Sign In")
    expect(page).to have_link("Cart")
  end
end
