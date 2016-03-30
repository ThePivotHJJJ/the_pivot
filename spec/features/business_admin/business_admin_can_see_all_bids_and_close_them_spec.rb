require "rails_helper"

feature "business admin can see all bids and close them" do
  scenario "they see a list of bids for their items and can close them" do
    create_business_admin_and_shop
    create_item_for_shop
    create_item_for_shop
    logout
    item1 = Item.first
    item2 = Item.last

    

  end
end
