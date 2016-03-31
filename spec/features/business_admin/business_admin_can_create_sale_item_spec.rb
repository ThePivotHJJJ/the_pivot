require "rails_helper"

feature "business admin can create shop item" do
  scenario "they see the new shop item" do
    create_business_admin_and_shop

    visit admin_dashboard_path
    click_on "Add new item"

    fill_in "Title", with: "all of teh lulz"
    fill_in "Description", with: "this is all the lulz you could imagine!!"
    fill_in "Price", with: "100"
    fill_in "Tags", with: "lulzy, double_lulz, all_of_teh_lulz"
    attach_file "Image", "spec/assets/carmer-got-carmed.gif"

    click_on "add new item!"

    expect(page).to have_content "all of teh lulz"
    expect(page).to have_content "this is all the lulz you could imagine!!"
    expect(page).to have_content "$1.00"
  end

  scenario "invalid item input" do
    create_business_admin_and_shop

    visit admin_dashboard_path

    click_link "Add new item"

    fill_in "Title",       with: ""
    fill_in "Description", with: ""
    fill_in "Price",       with: 300
    fill_in "Tags",        with: ""
    attach_file "Image", "spec/assets/singer-reimagined-porsche-911.jpg"
    click_button "add new item!"

    expect(page).to have_content "Invalid Entry, Try again."
  end
end
