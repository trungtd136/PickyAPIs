class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :img_thumb_url
      t.string :img_url
      t.integer :profile_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
