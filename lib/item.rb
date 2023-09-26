class Item
  attr_reader :name, :bids, :open_for_bid

  def initialize(name)
    @name = name
    @bids = Hash.new()
    @open_for_bid = true
  end

  def add_bid(attendee, amount)
    if @open_for_bid == true
      @bids[attendee] = amount
    else
      p 'The bidding on this has closed.'
    end
  end

  def current_high_bid
    bid_amounts = []
    @bids.each do |bid|
      bid_amounts << bid.last
    end
    bid_amounts.max
  end

  def close_bidding
    @open_for_bid = false
  end
end