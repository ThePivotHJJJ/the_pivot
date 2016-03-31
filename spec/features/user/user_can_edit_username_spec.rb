require "rails_helper"

feature "user can edit their username" do
  scenario "they see their updated username" do
    create_roles
    create_registered_user
    user = User.find_by(username: "Misty")
    login(user)

    visit dashboard_path

    click_on "Edit My Profile"

    fill_in "Username", with: "Ash"
    click_on "Save"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Welcome, Ash"
  end

  scenario "invalid input" do
    create_roles
    create_registered_user
    user = User.find_by(username: "Misty")
    login(user)

    visit dashboard_path

    click_on "Edit My Profile"

    fill_in "Username", with: ""
    click_on "Save"

    expect(current_path).to_not eq dashboard_path
    expect(page).to_not have_content "Welcome, Ash"
  end
end
