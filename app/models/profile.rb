class Profile < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  has_many :photos
  has_many :reviews

  has_many :todo_restaurants
  has_many :todos, :through => :todo_restaurants, :source => :restaurant

  has_many :favourite_restaurants
  has_many :favourites, :through => :favourite_restaurants, :source => :restaurant

  accepts_nested_attributes_for :todo_restaurants, :allow_destroy => true
  accepts_nested_attributes_for :favourite_restaurants, :allow_destroy => true

  def get_list_todos
    todos = TodoRestaurant.where(profile_id: self.id)
  end

  def get_todo_with_restaurant_id restaurant_id
    todo = TodoRestaurant.where(profile_id: self.id,restaurant_id: restaurant_id).take
  end

  def get_favourite_with_restaurant_id restaurant_id
    favourite = FavouriteRestaurant.where(profile_id: self.id,restaurant_id: restaurant_id).take
  end
end