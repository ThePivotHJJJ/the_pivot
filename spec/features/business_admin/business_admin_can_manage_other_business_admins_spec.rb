require "rails_helper"

feature "Business admin can manage other business admins" do
  scenario "the new admin is listed as shop admin" do
    create_roles
    create_registered_user
    create_business_admin_and_shop
    user = User.first

    visit admin_users_path

    within('.add-admin') do
      fill_in "Email", with: user.email
      click_on "Add business admin"
    end

    expect(current_path).to eq admin_users_path

    within('.shop-admins') do
      expect(page).to have_content user.username
      expect(page).to have_content user.email
    end
  end

  scenario "the removed admin is listed as non-admin user" do
    create_roles
    create_registered_user
    create_business_admin_and_shop
    user = User.find_by(username: "Misty")
    user.roles << Role.find_by(name: "business_admin")
    shop = Shop.find_by(name: "Double J's Yummy Snack Party")
    user.update(shop_id: shop.id)

    visit admin_users_path

    within('.shop-admins') do
      expect(page).to have_content user.username
      expect(page).to have_content user.email
    end

    within('.remove-admin') do
      fill_in "Email", with: user.email
      click_on "Remove business admin"
    end

    expect(current_path).to eq admin_users_path

    within('.shop-admins') do
      expect(page).to_not have_content user.username
      expect(page).to_not have_content user.email
    end
  end
end
