require "test_helper"

class itemTagTest < ActiveSupport::TestCase
  should belong_to(:item)
  should belong_to(:tag)
end
