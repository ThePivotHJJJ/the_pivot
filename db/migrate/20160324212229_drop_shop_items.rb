class DropShopItems < ActiveRecord::Migration
  def change
    drop_table :shop_items
  end
end
