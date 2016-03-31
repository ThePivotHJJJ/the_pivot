require "rails_helper"

feature "business admin can update shop name" do
  scenario "they see the new shop name" do
    create_roles
    create_business_admin_and_shop

    expect(current_path).to eq admin_dashboard_path

    click_on "Edit Shop Name"
    fill_in "Name", with: "Controversial Sock Emporium"
    click_on "Save"

    expect(current_path).to eq admin_dashboard_path
    expect(page).to have_content "Controversial Sock Emporium"
  end

  scenario "invalid name" do
    create_roles
    create_business_admin_and_shop

    expect(current_path).to eq admin_dashboard_path

    click_on "Edit Shop Name"
    fill_in "Name", with: ""
    click_on "Save"

    expect(current_path).to_not eq admin_dashboard_path
    expect(page).to have_content "Invalid input"
  end
end
