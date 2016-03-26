require "rails_helper"

feature "visitor must sign in to create shop" do
  scenario "they see the login page" do
    visit root_path

    within('.navbar-collapse') do
      click_on "Sell on PABOI"
    end

    expect(current_path).to eq login_path
    expect(page).to have_button "Login"
    expect(page).to have_link "Haven't Registered? Sign up here!"
    expect(page).to have_content "Please login or create a new account."
  end
end
