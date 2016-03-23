class ChangeOrderitemstoOrderItems < ActiveRecord::Migration
  def change
    rename_table :order_items, :order_items
  end
end
