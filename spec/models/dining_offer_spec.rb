require 'spec_helper'

describe DiningOffer do
  before(:each) do
  	@offer = build(:dining_offer)
  end

  it "has a valid factory" do
  	@offer.should be_valid
  end

  it "it not valid without a title" do
  	@offer.title = nil
  	@offer.should_not be_valid
  end

  it "it not valid without a restaurant_id" do
  	@offer.restaurant_id = nil
  	@offer.should_not be_valid
  end

  it { should ensure_length_of(:description).
              is_at_least(5).
              is_at_most(255) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:restaurant_id) }

  it { should belong_to(:restaurant) }
end
