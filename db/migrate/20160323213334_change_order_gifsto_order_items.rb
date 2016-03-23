class ChangeOrderGifstoOrderItems < ActiveRecord::Migration
  def change
    rename_table :order_gifs, :order_items
  end
end
