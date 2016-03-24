class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    # @shop = Shop.find(params[:id])
    binding.pry
    shop = Shop.find_by(slug: params[:shop])
    @items = shop.items
  end
end
