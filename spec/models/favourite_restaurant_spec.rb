require 'spec_helper'

describe FavouriteRestaurant do
   before(:each) do
   		@favourite = build(:favourite_restaurant)
   end

   it "has a valid factory" do
   		@favourite.should be_valid
   end

    it "is not valid without a profile_id" do
 		@favourite.profile_id = nil
 	 	@favourite.should_not be_valid
	end

  it "is not valid without a restaurant_id" do
    @favourite.restaurant_id = nil
    @favourite.should_not be_valid
  end

  it { should validate_presence_of(:profile_id) }

  it { should validate_presence_of(:restaurant_id) }

  it { should belong_to(:restaurant) }

  it { should belong_to(:profile) }
end
