require "rails_helper"

feature "Visitor can register" do
  scenario "they are directed to their dashboard" do
    visit "/"

    click_on "sign_up"
    fill_in "Username",  with: "Brock"
    fill_in "Password", with: "password"
    click_on "Create Account"

    expect(page).to have_content("logged_in_as_Brock")
    expect(current_path).to eq("/dashboard")
  end
end
