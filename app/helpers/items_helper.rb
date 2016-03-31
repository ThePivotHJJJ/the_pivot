module ItemsHelper
  def winning_bid_link(item_id)
    link_to "Won", cart_items_path(item_id: item_id), method: :post
  end
end
