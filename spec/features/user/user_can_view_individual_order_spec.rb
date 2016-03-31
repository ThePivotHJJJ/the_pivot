require "rails_helper"

feature "user can view an order" do
  scenario "they see the order info" do
    create_roles
    create_registered_user
    user = User.find_by(username: "Misty")
    login(user)

    order1 = user.orders.create(total_price: 10000)
    order2 = user.orders.create(total_price: 10000)

    visit "/orders"

    click_on "Order #{order1.id}"

    expect(page).to have_content "Your Order ##{order1.id}"
    expect(page).to have_content order1.status
  end
end
