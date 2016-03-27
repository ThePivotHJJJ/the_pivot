module ItemsHelper
  def item_status(bid, current_user)
    # status = bid.item.status(current_user)
    if bid.item.retired?
      if bid.item.max_bid_user == current_user
        link_to "Won", "#"
      end
    else
    end
  end
end
