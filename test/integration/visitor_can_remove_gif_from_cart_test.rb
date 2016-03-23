require "test_helper"

class VisitorCanRemoveitemFromCartTest < ActionDispatch::IntegrationTest
  test "visitor no longer sees removed item in cart" do
    item = create(:item)
    item2 = create(:item)
    visit item_path(item)
    click_link "Add to cart"
    visit item_path(item2)
    click_link "Add to cart"

    click_link "cart(2)"

    within first("#item-info", minimum: 1) do
      click_link("Remove")
    end

    assert_equal "/cart", current_path
    assert page.has_content?(item2.title)
    refute page.has_content?(item.description)

    assert page.has_content?("Successfully removed license for #{item.title}")
    assert page.has_link?(item.title)
  end
end
