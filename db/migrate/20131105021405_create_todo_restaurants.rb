class CreateTodoRestaurants < ActiveRecord::Migration
  def change
    create_table :todo_restaurants, {:id => false}  do |t|
      t.integer :profile_id
      t.integer :restaurant_id
      t.integer :status

      t.timestamps
    end
  end
end
