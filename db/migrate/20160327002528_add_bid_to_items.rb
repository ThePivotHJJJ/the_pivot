class AddBidToItems < ActiveRecord::Migration
  def change
    add_column :items, :bid, :boolean, default: false
  end
end
