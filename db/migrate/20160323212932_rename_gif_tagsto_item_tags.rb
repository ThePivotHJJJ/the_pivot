class RenameitemTagstoItemTags < ActiveRecord::Migration
  def change
    rename_table :item_tags, :item_tags
  end
end
