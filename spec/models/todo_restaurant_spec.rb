require 'spec_helper'

describe TodoRestaurant do
  before(:each) do
   		@todo = build(:todo_restaurant)
   end

   it "has a valid factory" do
   		@todo.should be_valid
   end

    it "is not valid without a profile_id" do
 		@todo.profile_id = nil
 	 	@todo.should_not be_valid
	end

  it "is not valid without a restaurant_id" do
    @todo.restaurant_id = nil
    @todo.should_not be_valid
  end

  it { should validate_presence_of(:profile_id) }

  it { should validate_presence_of(:restaurant_id) }

  it { should belong_to(:restaurant) }

  it { should belong_to(:profile) }
end
