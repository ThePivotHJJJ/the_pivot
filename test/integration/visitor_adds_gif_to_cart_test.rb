require "test_helper"

class VisitorAddsitemToCartTest < ActionDispatch::IntegrationTest
  test "displays message about putting item in cart and shows cart content" do
    item = create(:item)

    visit item_path(item)

    refute page.has_content?("cart(1)")
    click_link "Add to cart"

    assert page.has_content?("You added 1 license for #{item.title}")
    assert page.has_content?("cart(1)")
  end

  test "after adding item to cart visitor views cart and sees item" do
    item = create(:item)
    visit item_path(item)
    click_link "Add to cart"

    click_link "cart(1)"

    assert_equal "/cart", current_path
    assert page.has_content?(item.title)
    assert page.has_content?(item.description)
    assert page.has_content?("$1")
    assert page.has_content?(item.description)
    assert page.has_content?("Total: $1")
  end
end
