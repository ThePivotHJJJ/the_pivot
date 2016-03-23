class RenameGifstoItems < ActiveRecord::Migration
  def change
    rename_table :gifs, :items
  end
end
