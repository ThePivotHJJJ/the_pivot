require "rails_helper"

feature "platform admin can manage other admins" do
  scenario "they demote an admin" do
    create_roles
    create_business_admin_and_shop
    logout
    create_second_business_admin_and_shop
    logout
    create_platform_admin

    expect(current_path).to eq admin_dashboard_path

    click_on "Manage Admins"

    expect(current_path).to eq admin_users_path

    within("#admin-list") do
      expect(page).to have_content("Brock")
      expect(page).to have_content("Sock")
    end
    within("#admin-#{(User.all.last.id - 1)}") do
      click_on("Remove Sock as shop admin")
    end

    expect(current_path).to eq admin_users_path
    within("#admin-list") do
      expect(page).to have_content("Brock")
      expect(page).not_to have_content("Sock")
    end
  end


  scenario "they promote a user" do
    create_roles
    create_registered_user
    create_platform_admin

    expect(current_path).to eq admin_dashboard_path

    click_on "Manage Admins"

    expect(current_path).to eq admin_users_path

    expect(page).not_to have_content("Misty")

    fill_in "Username", with: "Misty"

    click_on "Promote/Demote"

    expect(current_path).to eq admin_users_path
save_and_open_page
    expect(page).to have_content("Misty")
  end
end