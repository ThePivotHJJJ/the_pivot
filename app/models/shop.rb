class Shop < ActiveRecord::Base
  has_many :items
  has_many :users
  before_validation :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
