require "rails_helper"

feature "platform admin can update a shop's name" do
  scenario "they see the new shop name" do
    create_roles
    create_business_admin_and_shop
    logout
    create_platform_admin

    expect(current_path).to eq platform_admin_dashboard_path

    click_on "Manage Stores"

    expect(current_path).to eq platform_admin_shops_path

    within("#shop-#{Shop.all.last.id}") do
      expect(page).to have_content("Double J's Yummy Snack Party")
      click_on "Edit Shop"
    end

    fill_in "Name", with: "Jim's Questionable Quantum Curios"
    click_on "Save"

    expect(current_path).to eq platform_admin_shops_path

    within("#shop-#{Shop.all.last.id}") do
      expect(page).to have_content("Jim's Questionable Quantum Curios")
      expect(page).not_to have_content("Double J's Yummy Snack Party")
    end
  end

  scenario "invalid name input" do
    create_roles
    create_business_admin_and_shop
    logout
    create_platform_admin

    expect(current_path).to eq platform_admin_dashboard_path

    click_on "Manage Stores"

    expect(current_path).to eq platform_admin_shops_path

    within("#shop-#{Shop.all.last.id}") do
      expect(page).to have_content("Double J's Yummy Snack Party")
      click_on "Edit Shop"
    end

    fill_in "Name", with: ""
    click_on "Save"

    expect(current_path).to_not eq platform_admin_shops_path
    expect(page).to have_content "Invalid input"
  end
end
