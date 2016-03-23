class AddRetiredToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :retired, :boolean, default: false
  end
end
