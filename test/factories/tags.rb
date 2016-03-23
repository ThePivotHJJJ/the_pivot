FactoryGirl.define do
  factory :tag do
    name { Faker::Hipster.word.capitalize }

    factory :tag_with_items do
      transient do
        items_count 2
      end

      after(:create) do | tag, evaluator|
        create_list(:item, evaluator.items_count, tags: [tag])
      end
    end
  end
end
