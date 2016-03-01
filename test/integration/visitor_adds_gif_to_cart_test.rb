require 'test_helper'

class VisitorAddsGifToCartTest < ActionDispatch::IntegrationTest
  test "displays message about putting gif in cart and shows cart content" do
    gif = create(:gif)

    visit gif_path(gif)
save_and_open_page
    assert page.has_content?("Cart(0)")

    click_button "Purchase"

    assert page.has_content?('You placed "#{gif.title}" into your cart.')
    assert page.has_content?("Cart (1)")
  end
end
