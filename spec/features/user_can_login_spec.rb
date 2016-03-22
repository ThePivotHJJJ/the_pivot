require "rails_helper"

feature "User can login" do
  scenario "they see their dashboard" do
    FactoryGirl.create(:user)
    user = User.first

    visit root_path
    click_on "login"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    within ".login" do
      click_on "Login"
    end

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("logged_in_as_#{user.username}")
    expect(page).to_not have_content("login")
    expect(page).to have_content("logout")
  end
end
