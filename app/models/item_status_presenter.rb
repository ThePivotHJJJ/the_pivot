class ItemStatusPresenter

  def self.bid_status(bid, current_user)
    if bid.item.retired?
      bid_outcome(bid, current_user)
    else
      "Open"
    end
  end

  def self.admin_bid_status(bid)
    if bid.item.retired?
      "Closed"
    else
      "Open"
    end
  end

private
  def self.bid_outcome(bid, current_user)
    if bid.item.max_bid_user == current_user
      "Won"
    else
      "Lost"
    end
  end
end
