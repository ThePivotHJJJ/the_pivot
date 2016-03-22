FactoryGirl.define do
    sequence :name do |n|
      "Shop ##{n}"
    end

  factory :shop do
    name
  end
end
