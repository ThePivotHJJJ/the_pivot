class Shop::ItemsController < ApplicationController
  def show
    @item = find_item
  end
end
