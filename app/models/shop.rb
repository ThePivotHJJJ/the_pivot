class Shop < ActiveRecord::Base
  has_many :items
  has_many :users
  has_many :orders, through: :items
  before_validation :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
