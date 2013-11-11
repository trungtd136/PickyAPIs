require 'spec_helper'

describe Restaurant do
  before(:each) do
    @restaurant = build(:restaurant)
  end

  it "has a valid factory" do
    @restaurant.should be_valid
  end

  it "is not valid without a name" do
    @restaurant.name = nil
    @restaurant.should_not be_valid
  end

  it "is not valid with invalid raiting value (negative number)" do
    @restaurant.raiting = -1
    @restaurant.should_not be_valid
  end

  it "is not valid with invalid raiting value (raiting > 5)" do
    @restaurant.raiting = 6
    @restaurant.should_not be_valid
  end

  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:name) }

  it { should have_many(:dining_offers) }

  it { should have_many(:reviews) }

  it { should have_many(:photos) }
end
