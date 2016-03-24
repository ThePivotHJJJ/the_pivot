class Shop < ActiveRecord::Base
  has_many :shop_items
  has_many :items, through: :shop_items
  before_validation :generate_slug

private

  def generate_slug
    self.slug = name.parameterize
  end
end
