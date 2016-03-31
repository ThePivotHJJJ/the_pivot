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

  def logout
    visit "/"
    click_link "Sign Out"
  end

  def create_business_admin_and_shop
    create_roles

    visit "/"

    within('.navbar-collapse') do
      click_on "Register"
    end

    fill_in "Username",  with: "Brock"
    fill_in "Password",  with: "password"
    fill_in "Email", with: "brock@gmail.com"
    click_on "Create Account"

    click_on "Sign Out"

    user = User.find_by(username: "Brock")
    login(user)

    visit root_path

    within('.navbar-collapse') do
      click_on "Sell on PABOI"
    end

    fill_in "Name", with: "Double J's Yummy Snack Party"
    click_on "Create shop"
  end

  def create_item_for_shop
    admin = User.first
    shop = Shop.first
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item
    logout
  end

  def close_bid(admin, shop, item)
    login(admin)
    visit shop_item_path(shop: shop.slug, id: item.id)
    click_link "Close bidding"
    logout
  end

  def create_shop_item
    visit admin_dashboard_path
    click_on "Add new item"

    fill_in "Title", with: "all of teh lulz"
    fill_in "Description", with: "this is all the lulz you could imagine!!"
    fill_in "Price", with: "100"
    fill_in "Tags", with: "lulzy, double_lulz, all_of_teh_lulz"
    attach_file "Image", "spec/assets/carmer-got-carmed.gif"

    click_on "add new item!"
  end

  def create_multiple_orders(num)
    num.times do
      user = create(:user)
      item = create(:item)
      shop = Shop.find_by(name: "Double J's Yummy Snack Party")
      item.update(shop_id: shop.id)

      OrderItem.create(
        item_id: item.id, quantity: 1, subtotal: 100
      )
      order = user.orders.create!(total_price: 100, status: 0)
    end
  end

  def user_wins_bid(user, admin, shop, item)
    visit root_path
    click_link "Shops"
    click_link shop.name
    click_link item.title
    click_button "Bid"
    logout
    close_bid(admin, shop, item)
    login(user)
    click_link "My Profile"
    click_link "My Bids"
  end

  def create_roles
    Role.create(name: "registered_user")
    Role.create(name: "business_admin")
    Role.create(name: "platform_admin")
  end

  def create_registered_user
    visit "/"

    within('.navbar-collapse') do
      click_on "Register"
    end

    fill_in "Username",  with: "Misty"
    fill_in "Password",  with: "password"
    fill_in "Email", with: "misty@gmail.com"
    click_on "Create Account"

    click_on "Sign Out"
  end

  def create_second_user
    visit "/"

    within('.navbar-collapse') do
      click_on "Register"
    end

    fill_in "Username",  with: "Ash"
    fill_in "Password",  with: "password"
    fill_in "Email", with: "ash@gmail.com"

    click_on "Create Account"

    click_on "Sign Out"
  end

  def create_platform_admin
    create_roles

    visit "/"

    within('.navbar-collapse') do
      click_on "Register"
    end

    fill_in "Username",  with: "Jim"
    fill_in "Password",  with: "password"
    fill_in "Email", with: "jim@gmail.com"
    click_on "Create Account"

    click_on "Sign Out"

    user = User.find_by(username: "Jim")
    user.roles << Role.find_by(name: "platform_admin")
    login(user)
  end

  def create_second_business_admin_and_shop
    create_roles

    visit "/"

    within('.navbar-collapse') do
      click_on "Register"
    end

    fill_in "Username",  with: "Sock"
    fill_in "Password",  with: "password"
    fill_in "Email", with: "sock@gmail.com"
    click_on "Create Account"

    click_on "Sign Out"

    user = User.find_by(username: "Sock")
    login(user)

    visit root_path

    within('.navbar-collapse') do
      click_on "Sell on PABOI"
    end

    fill_in "Name", with: "Some Clever Store Name"
    click_on "Create shop"
  end
end
