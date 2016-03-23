FactoryGirl.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    image { Faker::Avatar.image }
  end
end
