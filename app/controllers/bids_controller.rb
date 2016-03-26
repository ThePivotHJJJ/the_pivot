class BidsController < ApplicationController
  def index
    @bids = current_user.bids
  end

  def create
    item = Item.find(params[:item])
    bid = Bid.new(user_id: current_user.id, item_id: item.id)

    if item.bids.any?
      bid.update(bid_price: item.max_bid + 100)
    else
      bid.update(bid_price: 100)
    end

    bid.save
    flash[:success] = "Placed a bid for #{format_price(item.max_bid)} on #{item.title}"
    redirect_to shop_item_path(shop: item.shop.slug, id: item.id)
  end
end
