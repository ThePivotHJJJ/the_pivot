class Admin::BidsController < Admin::BaseController
  def index
    @item_bids = current_user.shop.items.map do |item|
      item.bids
    end.flatten
  end
end
