require "rails_helper"

feature "platform admin can manage other admins" do
  scenario "they demote an admin" do
    create_roles
    create_business_admin_and_shop
    logout
    create_second_business_admin_and_shop
    logout
    create_platform_admin

    expect(current_path).to eq platform_admin_dashboard_path

    click_on "Manage Admins"

    expect(current_path).to eq platform_admin_users_path

    within(".shop-admins") do
      expect(page).to have_content("Brock")
      expect(page).to have_content("Double J's Yummy Snack Party")
      expect(page).to have_content("Sock")
      expect(page).to have_content("Some Clever Store Name")
    end

    user = User.find_by(username: "Sock")
    within('.remove-admin') do
      fill_in "Email", with: user.email
      click_on "Remove business admin"
    end

    expect(current_path).to eq platform_admin_users_path

    within(".shop-admins") do
      expect(page).to have_content("Brock")
      expect(page).to have_content("Double J's Yummy Snack Party")
      expect(page).not_to have_content("Sock")
      expect(page).not_to have_content user.email
      expect(page).not_to have_content user.shop.name
    end
  end

  scenario "they promote an admin" do
    create_roles
    create_business_admin_and_shop
    logout
    create_second_business_admin_and_shop
    logout
    create_registered_user
    create_platform_admin

    expect(current_path).to eq platform_admin_dashboard_path

    click_on "Manage Admins"

    expect(current_path).to eq platform_admin_users_path

    within(".shop-admins") do
      expect(page).to have_content("Brock")
      expect(page).to have_content("Double J's Yummy Snack Party")
      expect(page).to_not have_content("Misty")
    end

    user = User.find_by(username: "Misty")
    shop = Shop.find_by(name: "Some Clever Store Name")

    within('.add-admin') do
      fill_in "Email", with: user.email
      fill_in "Shop", with: shop.id
      click_on "Add business admin"
    end

    expect(current_path).to eq platform_admin_users_path

    user = User.find_by(username: "Misty")

    within(".shop-admins") do
      expect(page).to have_content("Brock")
      expect(page).to have_content("Double J's Yummy Snack Party")
      expect(page).to have_content user.username
      expect(page).to have_content user.email
      expect(page).to have_content user.shop.name
    end
  end
end
