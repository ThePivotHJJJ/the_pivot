FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "user#{n}" }
    password "password"
    email "mistyqtestemail@gmail.com"
  end
end
