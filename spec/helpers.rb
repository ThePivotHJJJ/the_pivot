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
end
