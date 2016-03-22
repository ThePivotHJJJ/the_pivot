require "rails_helper"

feature "user can view dashboard" do
  scenario "they are directed to their dashboard after loggin in" do
    create_and_login_user

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, Brock")
    expect(page).to have_content("Recently Bought")
    expect(page).to have_content("Recently Sold")
    expect(page).to have_content("Recently Viewed")
    expect(page).to have_content("Edit My Profile")
    expect(page).to have_content("My Bids")
    expect(page).to have_content("My Orders")
    expect(page).to have_content("Manage My Shop")
  end
end
