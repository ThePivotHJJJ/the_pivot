class AddQuantityToOrderGifs < ActiveRecord::Migration
  def change
    add_column :order_gifs, :quantity, :integer
  end
end
