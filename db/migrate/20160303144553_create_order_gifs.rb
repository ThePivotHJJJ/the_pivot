class CreateOrderGifs < ActiveRecord::Migration
  def change
    create_table :order_gifs do |t|
      t.references :order, index: true, foreign_key: true
      t.references :gif, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
