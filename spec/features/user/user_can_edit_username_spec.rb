require "rails_helper"

feature "user can edit their username" do
  scenario "they see their updated username" do
    user = User.create(username: "Brock", password: "password")
    login(user)

    visit dashboard_path

    click_on "Edit My Profile"

    fill_in "Username", with: "Misty"
    click_on "Save"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Welcome, Misty"
  end
end
