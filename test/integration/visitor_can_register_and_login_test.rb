require 'test_helper'

class VisitorCanRegisterAndLoginTest < ActionDispatch::IntegrationTest
  test "visitor can signup for account" do
    visit '/'

    click_on "sign_up"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"

    click_on "Create Account"

    assert page.has_content?("logged_in_as_Brock")
  end

  test "visitor can login and see their dashboard with a logout link" do
    user = User.create(username: "Brock", password: "password")
    visit '/'

    click_on "login"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"

    within ".login" do
      click_on "Login"
    end

    assert_equal "/dashboard", current_path

    assert page.has_content?("logged_in_as_#{user.username}")
    refute page.has_content?("login")
    assert page.has_content?("logout")
  end

  test "visitor adds stuff to cart and still sees it upon login" do
    item = create(:item)
    visit item_path(item)
    click_link "Add to cart"

    create_and_login_user

    visit 'cart'
    assert_equal "/cart", current_path
    assert page.has_content?(item.title)
    assert page.has_content?(item.description)
  end
end
