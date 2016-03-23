class ChangeGifIdToItemIdOnOrderItems < ActiveRecord::Migration
  def change
    rename_column :order_items, :gif_id, :item_id
  end
end
