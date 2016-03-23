require "rails_helper"

feature "Visitor can register" do
  scenario "they are directed to their dashboard" do
    visit "/"

    click_on "Register"
    fill_in "Username",  with: "Brock"
    fill_in "Password",  with: "password"
    click_on "Create Account"

    expect(page).to have_content("Welcome, Brock")
    expect(current_path).to eq("/dashboard")
  end

  context "with invalid information" do
    scenario "they see an error message" do
      visit "/"

      click_on "Register"
      fill_in "Username",  with: "Brock"
      fill_in "Password",  with: ""
      click_on "Create Account"

      expect(page).to have_content("Invalid Input")
      expect(current_path).to_not eq("/dashboard")
    end
  end
end
