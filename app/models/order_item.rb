class OrderItem < ActiveRecord::Base
  validates :quantity, presence: true
  validates :subtotal, presence: true
  belongs_to :order
  belongs_to :item
end
