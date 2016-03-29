class AuctionCloser
  def initialize(item_id)
    @_item = Item.find(item_id)
  end

  def close
    item.update(retired: true)
    # find the winning bid
    # find the winning bid user
    en
    item.bids
  end

  def self.close(auction_id)
    new(auction_id).close
  end

  private
    def item
      @_item
    end
end
