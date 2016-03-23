class ChangeGifIdToItemIdonTags < ActiveRecord::Migration
  def change
    rename_column :item_tags, :gif_id, :item_id
  end
end
