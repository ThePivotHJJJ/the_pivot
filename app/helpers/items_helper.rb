module ItemsHelper
  def item_status(bid, current_user)
    if bid.item.retired?
      if bid.item.max_bid_user == current_user
        link_to "Won", cart_items_path(item_id: bid.item.id), method: :post
      else
        "Lost"
      end
    else
      "Open"
    end
  end

  def admin_item_status(bid)
    if bid.item.retired?
      "Closed"
    else
      "Open"
    end
  end
end
