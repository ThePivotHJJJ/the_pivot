class CreateShopItems < ActiveRecord::Migration
  def change
    create_join_table :items, :shops
  end
end
