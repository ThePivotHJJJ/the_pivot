require "rails_helper"

feature "user can become business admin" do
  scenario "they see the manage my shop dashboard" do
    create_roles
    create_registered_user
    user = User.find_by(username: "Misty")
    login(user)

    visit root_path

    within('.navbar-collapse') do
      click_on "Sell on PABOI"
    end

    fill_in "Name", with: "Double J's Yummy Snack Party"
    click_on "Create shop"

    expect(current_path).to eq admin_dashboard_path
    expect(page).to have_content "Manage My Shop"
    expect(page).to have_content "Double J's Yummy Snack Party"
  end
end
