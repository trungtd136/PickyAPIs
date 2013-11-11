require 'spec_helper'

describe Review do
  before(:each) do
  	@review = build(:review)
  end

  it "has a valid factory" do
  	@review.should be_valid
  end

  it "is not valid without a content" do
  	@review.content = nil
  	@review.should_not be_valid
  end

  it "is not valid without a profile_id" do
  	@review.profile_id = nil
  	@review.should_not be_valid
  end

  it "is not valid without a restaurant_id" do
  	@review.restaurant_id = nil
  	@review.should_not be_valid
  end

  it { should ensure_length_of(:content).
              is_at_least(5).
              is_at_most(255) }

  it { should validate_presence_of(:content) }

  it { should validate_presence_of(:profile_id) }

  it { should validate_presence_of(:restaurant_id) }

  it { should belong_to(:restaurant) }

  it { should belong_to(:profile) }
end
