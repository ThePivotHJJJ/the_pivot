module Helpers
  def login(user)
    visit '/'
    click_on "Sign In"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    within ".login" do
      click_on "Login"
    end
  end

  def create_business_admin_and_shop
    user = User.create(username: "Brock", password: "password")
    login(user)

    visit root_path

    within('.navbar-collapse') do
      click_on "Sell on PABOI"
    end

    fill_in "Name", with: "Double J's Yummy Snack Party"
    click_on "Create shop"
  end
end
