class DiningOffer < ActiveRecord::Base
	validates :title, :restaurant_id, presence: true
	validates :description, length: {minimum: 5, maximum: 255}, allow_blank: true

	belongs_to :restaurant
end
