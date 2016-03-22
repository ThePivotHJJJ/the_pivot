module Helpers
  def create_and_login_user
    user = User.create(username: "Brock", password: "password")

    visit '/'

    click_on "login"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"

    within ".login" do
      click_on "Login"
    end
  end
end
