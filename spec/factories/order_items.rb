FactoryGirl.define do
  factory :order_item do
    quantity Random.new.rand(1..10)
    subtotal Random.new.rand(200..1200)
    after_create do |og|
      Factory(:order, :order_items => [og])
      Factory(:user, :order_items => [og])
    end
  end
end
