class Tag < ActiveRecord::Base
  has_many :item_tags, dependent: :destroy
  has_many :items, through: :item_tags
  validates :name, presence: true, uniqueness: true

  scope :alpha, -> { order("name asc") }
end
