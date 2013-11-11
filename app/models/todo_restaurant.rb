class TodoRestaurant < ActiveRecord::Base

	validates :profile_id, :restaurant_id, presence: true

	validates :profile_id, :uniqueness => { :scope => :restaurant_id }

	belongs_to :restaurant
	belongs_to :profile	

end
