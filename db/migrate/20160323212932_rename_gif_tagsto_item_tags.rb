class RenameGifTagstoItemTags < ActiveRecord::Migration
  def change
    rename_table :gif_tags, :item_tags
  end
end
