require "test_helper"

class AdminDeletesitemTest < ActionDispatch::IntegrationTest
  test "admin deletes a item in its show view and is redirected to back to original page" do
    create_and_return_admin
    item = create(:item)
    item.tags.create(name: "faves")
    visit items_path
    click_link item.title

    assert page.has_content? ("Delete")
    click_on "Delete"
    assert_equal root_path, current_path
  end
end
