class Review < ActiveRecord::Base
	validates :content, :profile_id, :restaurant_id, presence: true

	validates :content, length: {minimum: 5, maximum: 255}, allow_blank: true
	
	belongs_to :restaurant
	belongs_to :profile
end
