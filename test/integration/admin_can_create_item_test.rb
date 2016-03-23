require "test_helper"

class AdminCanCreateItemTest < ActionDispatch::IntegrationTest
  test "admin can create multiple item with mutliple tags" do
    create_and_return_admin
    create_a_item

    assert page.has_content? "all of teh lulz"

    visit tags_path

    assert page.has_content? "lulzy"
    assert page.has_content? "defeated"
    assert page.has_content? "dusty"
  end

  test "creating an image and giving it exisitng tags does not duplicate the tag" do
    create_and_return_admin
    create_a_item

    assert 1, Tag.where(name: "lulzy").count
    assert 1, Tag.where(name: "defeated").count
    assert 1, Tag.where(name: "dusty").count

    create_a_item

    assert 1, Tag.where(name: "lulzy").count
    assert 1, Tag.where(name: "defeated").count
    assert 1, Tag.where(name: "dusty").count
  end
end
