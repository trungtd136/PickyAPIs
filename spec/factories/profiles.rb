# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name "MyString"
    email "MyString@gmail.com"
    profile_icon "MyString"
  end

  factory :invalid_profile, parent: :profile do |f| 
    f.name nil 
  end
end
