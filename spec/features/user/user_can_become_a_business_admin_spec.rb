require "rails_helper"

feature "user can become business admin" do
  scenario "they see the manage my shop dashboard" do
    user = User.create(username: "Brock", password: "password")
    login(user)


  end
end

#must log in to create shop
#Sell on paboi leads to create for a shop
#Submitting create creates the shop and changes current user's role to business admin
#Redirected to Manage My Shop Page
