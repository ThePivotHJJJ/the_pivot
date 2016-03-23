ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "capybara/rails"
require "minitest/pride"
require 'mocha/mini_test'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  DatabaseCleaner.strategy = :transaction
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    reset_session!
    DatabaseCleaner.start
    super
  end

  def teardown
    reset_session!
    DatabaseCleaner.clean
    super
  end

  def create_and_return_admin
    admin = User.create(username: "July", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
  end

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

  def create_multiple_orders(num)
    num.times do
      user = create(:user)
      item = create(:item)
      OrderItem.create(
        item_id: item.id, quantity: 1, subtotal: 100
      )
      order = user.orders.create!(total_price: 100, status: 0)

      item = create(:item)
      order.order_items.create(
        item_id: item.id, quantity: 2, subtotal: 100
      )
    end
  end

  def create_a_item
    visit admin_dashboard_path
    click_on "Add New item"

    fill_in "Title", with: "all of teh lulz"
    fill_in "Description", with: "this is all the lulz you could imagine!!"
    fill_in "Price", with: "100"
    fill_in "Tags", with: "lulzy, defeated, dusty"
    attach_file "Image", "test/asset_tests/items/carmer-got-carmed.item"

    click_on "add new item!"
  end
end
