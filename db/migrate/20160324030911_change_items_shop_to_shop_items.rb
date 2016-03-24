class ChangeItemsShopToShopItems < ActiveRecord::Migration
  def change
    rename_table :items_shops, :shop_items
  end
end
