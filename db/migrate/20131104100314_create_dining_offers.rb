class CreateDiningOffers < ActiveRecord::Migration
  def change
    create_table :dining_offers do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :web_url
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
