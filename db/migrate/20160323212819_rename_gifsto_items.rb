class RenameitemstoItems < ActiveRecord::Migration
  def change
    rename_table :items, :items
  end
end
