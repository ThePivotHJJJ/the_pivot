class Order < ActiveRecord::Base
  validates :status, presence: true
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  has_many :shops, through: :items

  enum status: %w(ordered paid completed cancelled)

  def order_status
    if completed?
      "Order Complete on #{updated_at}"
    elsif cancelled?
      "Order cancelled on #{updated_at}"
    else
      "In progress"
    end
  end

  def update_status_paid
    update(status: 1)
  end
end
