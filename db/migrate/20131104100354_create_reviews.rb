class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :profile_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
