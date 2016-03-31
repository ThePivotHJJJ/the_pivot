class StatusLinkPresenter
  def self.won
    link_to "Won", cart_items_path(item_id: bid.item.id), method: :post
  end
end
