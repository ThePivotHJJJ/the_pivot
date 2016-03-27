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

  def logout(user)
    visit "/"
    click_on "Sign Out"
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

  def create_item_for_shop
    admin = User.first
    shop = Shop.first
    item = FactoryGirl.create(:item, bid: true)
    shop.items << item
    logout(admin)
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
      shop = create(:shop)
      item.update(shop_id: shop.id)

      OrderItem.create(
        item_id: item.id, quantity: 1, subtotal: 100
      )
      order = user.orders.create!(total_price: 100, status: 0)

      item = create(:item)
      shop = create(:shop)
      item.update(shop_id: shop.id)

      order.order_items.create(
        item_id: item.id, quantity: 2, subtotal: 100
      )
    end
  end
end
