class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = Hash.new()
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end
end