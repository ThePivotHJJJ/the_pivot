class Gif < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  has_many :gif_tags, dependent: :destroy
  has_many :tags, through: :gif_tags
  has_many :order_gifs, dependent: :destroy
  has_many :orders, through: :order_gifs
  attr_accessor :image

  has_attached_file :image, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    styles: {
      favicon: '16x16>',
      square: '200x200#',
      medium: '300x300>'
    }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def create_tags(gif_tags)
    gif_tags.each do |tag|
      gifs_tag = Tag.find_or_create_by(name: "#{tag}")
      gifs_tag.gifs << self
    end
  end

  def active
    !retired
  end

  def self.favorite_gifs
    joins(:tags).where(tags: {name: "faves"})
  end

  def self.all_active
    Gif.all.each { |gif| gif.active }
  end
end
