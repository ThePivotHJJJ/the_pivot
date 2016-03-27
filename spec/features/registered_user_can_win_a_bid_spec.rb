require "rails_helper"

feature "Registered user can win a bid" do
  scenario "they see that they have won the bid" do
    create_business_admin_and_shop
    create_item_for_shop
    # As a registered user
    # When I visit the shops path
    # And I click on the shop
    # And I click on the item
    # And I click on 'Bid'
    # And an Business admin closes the bid
    # When I visit 'My Profile'
    # And I click on 'Active Bids'
    # Then I see the item title
    # And I see the item Description
    # And I see the my bid
    # And I see the current bid
    # And I see the content 'Status'
    # And I see the link 'Won'
  end
end
