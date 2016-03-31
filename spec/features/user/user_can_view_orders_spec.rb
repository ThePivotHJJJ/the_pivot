require "rails_helper"

feature "user can view all their orders" do
  scenario "they see all their orders" do
    create_roles
    create_registered_user
    user = User.find_by(username: "Misty")
    login(user)

    order1 = user.orders.create(total_price: 10000)
    order2 = user.orders.create(total_price: 10000)

    visit "/orders"

    expect(page).to have_link "Order #{order1.id}"
    expect(page).to have_link "Order #{order1.id}"
  end
end
