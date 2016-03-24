FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "user#{n}}" }
    password "MyString"
  end
end
