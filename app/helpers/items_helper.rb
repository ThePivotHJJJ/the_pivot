module ItemsHelper
  def item_status(bid, current_user)
    if bid.item.retired?
      if bid.item.max_bid_user == current_user
        link_to "Won", cart_items_path(item_id: bid.item.id), method: :post
      end
    else
    end
  end
end
