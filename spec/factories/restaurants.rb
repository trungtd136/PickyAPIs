# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name "MyString"
    cuisine "MyString"
    address "MyText"
    contact "MyString"
    web_url "MyString"
    raiting 1.5
  end
end
