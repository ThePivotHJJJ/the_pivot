require 'test_helper'

class VisitorSeesCharityAssociatedWithitemViewTest < ActionDispatch::IntegrationTest
  test "visitor visits a item show page and sees a charity associated with a item" do
    charity = create(:charity)
    charity.items << create(:item)
    item = item.last
    visit item_path(item)

    assert page.has_content?(item.title)
    assert page.has_content?("Purchase of this item will support #{item.charity.name}")
    assert page.has_css?("img[src='#{item.charity.logo}']")
  end

  test "visitor sees charities on index page of all charities with links to view their items" do
    3.times do
      charity = create(:charity)
      charity.items << create(:item)
    end

    visit charities_path

    Charity.all.each do  | charity |
      assert page.has_content?(charity.name)
      assert page.has_css?("img[src='#{charity.logo}']")
      assert page.has_link?("View all items associated with this charity", charity_path(charity.id))
    end

    id = Charity.first.id
    visit charity_path(id)
    assert_equal "/charities/#{id}", current_path
  end
end
