require 'spec_helper'

describe Photo do
  before(:each) do
  	@photo = build(:photo)
  end

  it "has a valid factory" do
  	@photo.should be_valid
  end

  it "is not valid without a profile_id" do
  	@photo.profile_id = nil
  	@photo.should_not be_valid
  end  

  it "is not valid without a restaurant_id" do
  	@photo.restaurant_id = nil
  	@photo.should_not be_valid
  end

  it { should ensure_length_of(:description).
              is_at_least(5).
              is_at_most(255) }

  it { should validate_presence_of(:profile_id) }

  it { should validate_presence_of(:restaurant_id) }

  it { should belong_to(:restaurant) }

  it { should belong_to(:profile) }
end
