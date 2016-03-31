class BidsController < ApplicationController
  def index
    @bids = current_user.bids
  end

  def create
    if current_user
      item = Item.find(params[:item])
      bid = Bid.new(user_id: current_user.id, item_id: item.id)
      item.update_bid(bid)

      flash[:success] = "Placed a bid for #{format_price(item.max_bid)} on #{item.title}"
      redirect_to shop_item_path(shop: item.shop.slug, id: item.id)
    else
      visitor_must_login
    end
  end

  def destroy
    item = find_item
    item.update(retired: true)
    flash[:success] = "Item #{item.title} has been closed for bidding"

    UserNotifier.inform(item.max_bid_user.email).deliver_now
    flash[:notice] = "Email sent to #{item.max_bid_user.email} to notify #{item.max_bid_user.username} that they've won their bid!"

    redirect_to shop_item_path(shop: item.shop.slug, id: item.id)
  end
end
