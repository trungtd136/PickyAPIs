# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    content "MyText"
    profile_id 1
    restaurant_id 1
  end
end
