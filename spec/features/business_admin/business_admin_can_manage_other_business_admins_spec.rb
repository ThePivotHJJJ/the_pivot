require "rails_helper"

feature "Business admin can manage other business admins" do
  scenario "the new admin is listed as shop admin" do
    create_registered_user
    create_business_admin_and_shop
    user = User.first

    visit admin_users_path

    within ('.non-admin-users') do
      click_on "Make #{user.username} shop admin"
    end

    within('.shop-admins') do
      expect(page).to have_content user.username
      expect(page).to have_link "Remove #{user.username} as shop admin"
    end
  end

  scenario "the removed admin is listed as non-admin user" do
    create_registered_user
    create_business_admin_and_shop
    user = User.first

    visit admin_users_path

    within ('.non-admin-users') do
      click_on "Make #{user.username} shop admin"
    end

    within ('.shop-admins') do
      click_on "Remove #{user.username} as shop admin"
    end

    within ('.non-admin-users') do
      expect(page).to have_content user.username
      expect(page).to have_link "Make #{user.username} shop admin"
    end
  end
end
