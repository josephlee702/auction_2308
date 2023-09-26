class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = Hash.new()
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    bid_amounts = []
    @bids.each do |bid|
      bid_amounts << bid.last
    end
    bid_amounts.max
  end
end