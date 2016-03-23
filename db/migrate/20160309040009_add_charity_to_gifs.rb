class AddCharityToitems < ActiveRecord::Migration
  def change
    add_reference :items, :charity, index: true, foreign_key: true
  end
end
