class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :raiting, :inclusion => 1..5

	has_many :dining_offers
	has_many :reviews
	has_many :photos

	has_many :todo_restaurants
	has_many :favourite_restaurants

	def get_todo_status profile_id
	    todo = TodoRestaurant.where(restaurant_id: self.id, profile_id: profile_id).first	    
	    todo.status
  	end

  	def get_favourite_status profile_id
	    favourite = FavouriteRestaurant.where(restaurant_id: self.id, profile_id: profile_id).first	    
	    favourite.status
  	end
end
