class AddShopIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :shop, index: true, foreign_key: true
  end
end
