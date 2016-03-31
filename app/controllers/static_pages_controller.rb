class StaticPagesController < ApplicationController
  def landing
    @featured_items = Item.limit(4).order("RANDOM()")
    @featured_tags = Tag.limit(4).order("RANDOM()")
  end
end
