class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :password, presence: true

  has_many :orders
  has_many :order_items, through: :orders
  has_many :bids

  enum role: %w(default admin)
end
