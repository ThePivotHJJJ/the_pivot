require 'test_helper'

class UserCanViewARetireditemTest < ActionDispatch::IntegrationTest
  test "user can not add a retired item to cart" do
    user = create(:user)
    item = Item.create(title: "Hamster Dance",
                     description: "super sweet",
                     price: 100,
                     image: "https://placeholdit.imgix.net/~text?txtsize=60&bg=000000&txt=640%C3%97480&w=640&h=480&fm=png",
                     retired: true
    )
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    order = user.orders.create(total_price: 100, status: 2)
    order_item = order.order_items.create(item_id: item.id, quantity: 1, subtotal: 100)

    visit order_path(order.id)

    click_link item.title
    refute page.has_link? "Add to cart"
  end
end
