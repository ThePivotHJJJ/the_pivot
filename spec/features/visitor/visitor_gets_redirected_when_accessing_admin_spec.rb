require "rails_helper"

feature "visitor gets redirected trying to acess admin path" do
  scenario "they see the home page" do
    visit admin_dashboard_path

    expect(current_path).to eq root_path
  end
end
