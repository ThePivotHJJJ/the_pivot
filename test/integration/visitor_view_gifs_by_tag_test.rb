require "test_helper"

class VisitorViewitemsByTagTest < ActionDispatch::IntegrationTest
  test 'visitor views a tag page and sees all items in that tag' do
    item_1 = create(:item)
    item_2 = create(:item)
    item_1.tags.create(name: "animated")
    item_2.tags.create(name: "groups")

    visit "/tag/animated"

    assert page.has_content?(item_1.title)
    assert page.has_css?("img[src='#{item_1.image}']")
    refute page.has_content?(item_2.title)

    visit "/tag/groups"

    assert page.has_content?(item_2.title)
    assert page.has_css?("img[src='#{item_2.image}']")
    refute page.has_content?(item_1.title)
  end

  test "visitor can see a item with multiple tags on all tag pages" do
    item_1 = create(:item)
    item_1.tags.create(name: "animated")
    item_1.tags.create(name: "cute")

    visit "/tag/animated"

    assert page.has_content?(item_1.title)
    assert page.has_css?("img[src='#{item_1.image}']")

    visit "/tag/cute"

    assert page.has_content?(item_1.title)
    assert page.has_css?("img[src='#{item_1.image}']")
  end
end
