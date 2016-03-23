FactoryGirl.define do
  factory :item do
    title { Faker::Hacker.adjective.capitalize + " " + Faker::Hipster.word.capitalize }
    description { Faker::Hacker.say_something_smart.capitalize }
    price 100
    # retired false
    image "https://placeholdit.imgix.net/~text?txtsize=60&bg=000000&txt=640%C3%97480&w=640&h=480&fm=png"

    factory :item_with_tags do
      transient do
        tags_count 2
      end

      after(:create) do |item, evaluator|
        create_list(:tag, evaluator.tags_count, items: [item])
      end
    end
  end
end
