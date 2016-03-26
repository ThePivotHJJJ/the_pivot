require "rails_helper"

feature "User can sign in" do
  scenario "they see their dashboard" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_link("Edit My Profile")
    expect(page).to have_link("My Bids")
    expect(page).to have_link("My Orders")
    expect(page).to have_link("Manage My Shop")
    expect(page).to have_link("Sign Out")
    within(".nav") do
      expect(page).to have_link("My Profile")
    end
    expect(page).to_not have_link("Sign In")
    expect(page).to_not have_link("Register")
  end
end
