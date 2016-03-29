module ItemsHelper
  def item_status(bid, current_user)
    if bid.item.retired?
      if bid.item.max_bid_user == current_user
        link_to "Won", cart_items_path(item_id: bid.item.id), method: :post
      end
    else
    end
  end

  def winning_bid_link(item_id)
    link_to "Won", cart_items_path(item_id: item_id), method: :post
  end
end

class BidsPresenter
  attr_reader :user

  def initializer(item, user)
    @user = user
  end

  def decorated_bids
    item.bids.map { |bid| DecoratedBid.new(bid, user) }
  end
end


class DecoratedBid < SimpleDelegator
  attr_reader :user

  def initialize(bid, user)
    @user = user
    super(bid)
  end

  def status_class
    {
      true: :winning_and_retired,
      false: :active
    }
  end

  def status_link
    StatusLink.send(status_classes[bid.item.retired?])
  end
end

class StatusLink
  def initialize(user)
    @user = user
  end

  def retired
    "winning_bid_link"
  end

  def active
    "other_link"
  end
end
