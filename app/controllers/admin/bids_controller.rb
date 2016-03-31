class Admin::BidsController < ApplicationController
  def index
    shop_items = current_user.shop.items
    @item_bids = shop_items.map do |item|
      item.bids
    end.flatten
  end
end
