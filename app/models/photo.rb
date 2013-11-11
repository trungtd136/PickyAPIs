class Photo < ActiveRecord::Base
	validates :profile_id, :restaurant_id, presence: true

	validates :description, length: {minimum: 5, maximum: 255}, allow_blank: true
	
	belongs_to :restaurant
	belongs_to :profile
end
