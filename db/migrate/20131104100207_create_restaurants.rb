class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.text :address
      t.string :contact
      t.string :web_url
      t.float :raiting

      t.timestamps
    end
  end
end
