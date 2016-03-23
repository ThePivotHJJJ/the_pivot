class AddSubtotalToOrderGifs < ActiveRecord::Migration
  def change
    add_column :order_gifs, :subtotal, :integer
  end
end
