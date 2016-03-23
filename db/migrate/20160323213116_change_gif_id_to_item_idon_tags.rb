class ChangeitemIdToItemIdonTags < ActiveRecord::Migration
  def change
    rename_column :item_tags, :item_id, :item_id
  end
end
