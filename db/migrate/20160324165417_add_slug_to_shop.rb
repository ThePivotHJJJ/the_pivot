class AddSlugToShop < ActiveRecord::Migration
  def change
    add_column :shops, :slug, :string
  end
end
