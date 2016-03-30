class Admin::BidsController < Admin::BaseController
  def index
    shop_items = current_user.shop.items
    @item_bids = shop_items.map do |item|
      item.bids
    end.flatten
  end
end
