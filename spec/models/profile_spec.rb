require 'spec_helper'

describe Profile do
  before(:each) do
  	@profile = build(:profile)
  end

  it "has a valid factory" do
  	@profile.should be_valid
  end

  it "is not valid without a name" do
  	@profile.name = nil
  	@profile.should_not be_valid
  end  

  it "is not valid without a email" do
  	@profile.email = nil
  	@profile.should_not be_valid
  end

  it "is not valid with invalid email format" do
  	@profile.email = "test"
  	@profile.should_not be_valid
  end

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should_not allow_value("blah").for(:email) }

  it { should validate_uniqueness_of(:email) }

  it { should have_many(:photos) }

  it { should have_many(:reviews) }
end
