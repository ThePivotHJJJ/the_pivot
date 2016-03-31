require "rails_helper"

feature "visitor can login" do
  scenario "user sees dashboard" do
    create_roles
    create_registered_user

    visit root_path

    click_on "Sign In"

    fill_in "Username",  with: "Misty"
    fill_in "Password",  with: "password"
    click_on "Login"

    expect(page).to_not have_content("Invalid Login")
    expect(current_path).to eq("/dashboard")
  end

  scenario "invalid info, visitor sees login page" do
    visit root_path

    click_on "Sign In"

    fill_in "Username",  with: "Brock"
    fill_in "Password",  with: ""
    click_on "Login"

    expect(page).to have_content("Invalid Login")
    expect(current_path).to_not eq("/dashboard")
  end
end
