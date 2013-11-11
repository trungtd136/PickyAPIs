# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dining_offer do
    title "MyString"
    description "MyText"
    image_url "MyString"
    web_url "MyString"
    restaurant_id 1
  end
end
