class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true

  has_many :orders
  has_many :order_items, through: :orders
  has_many :bids
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  belongs_to :shop

  def business_admin?
    roles.exists?(name: "business_admin")
  end

  def registered_user?
    roles.exists?(name: "registered_user")
  end
end
