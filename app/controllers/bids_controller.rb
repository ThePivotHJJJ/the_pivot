class BidsController < ApplicationController
  def index
    @bids = current_user.bids
  end

  def create
    if current_user
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
    else
      flash[:info] = "Please login or create a new account before bidding."
      redirect_to login_path
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.update(retired: true)
    flash[:success] = "Item #{item.title} has been closed for bidding"
    redirect_to shop_item_path(shop: item.shop.slug, id: item.id)
  end
end
