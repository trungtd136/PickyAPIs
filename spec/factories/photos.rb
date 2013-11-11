# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title "MyString"
    description "MyText"
    img_thumb_url "MyString"
    img_url "MyString"
    profile_id 1
    restaurant_id 1
  end
end
