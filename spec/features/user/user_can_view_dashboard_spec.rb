require "rails_helper"

feature "user can view dashboard" do
  scenario "they are directed to their dashboard after logging in" do
    user = User.create(username: "Brock", password: "password")
    login(user)

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Recently Bought")
    expect(page).to have_content("Recently Sold")
    expect(page).to have_content("Recently Viewed")
    expect(page).to have_content("Edit My Profile")
    expect(page).to have_content("My Bids")
    expect(page).to have_content("My Orders")
    expect(page).to have_content("Manage My Shop")
  end
end
