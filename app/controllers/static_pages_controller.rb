class StaticPagesController < ApplicationController
  def landing
    @featured_items = Item.limit(4).order("RANDOM()")
  end
end
