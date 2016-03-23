class ChangeitemIdToItemIdOnOrderItems < ActiveRecord::Migration
  def change
    rename_column :order_items, :item_id, :item_id
  end
end
