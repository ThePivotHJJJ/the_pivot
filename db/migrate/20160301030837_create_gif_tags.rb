class CreateGifTags < ActiveRecord::Migration
  def change
    create_table :gif_tags do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :gif, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
