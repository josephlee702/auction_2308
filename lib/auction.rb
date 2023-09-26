class Auction
  attr_reader :items, :item_names

  def initialize
    @items = []
    @item_names = []
  end

  def add_item(item)
    @items << item
    @item_names << item.name
  end

  def unpopular_items
    no_bid_items = []
    @items.each do |item|
      if item.bids == {}
        no_bid_items << item
      end
    end
    no_bid_items
  end

  def potential_revenue
    #need to take the max bid on each item and add them together
    pot_rev = 0
    @items.each do |item|
      if item.bids != {}
        pot_rev += item.current_high_bid
      end
    end
    pot_rev
  end

  def bidders
    people_bidding = []
    @items.each do |item|
      if item.bids != {}
        item.bids.each do |bid|
          people_bidding << bid.first.name
        end
      end
    end
    people_bidding.uniq
  end

  def bidder_info
    info_of_bidders = Hash.new()
    budget_and_items = Hash.new()
    items_bid_on = []

    
    @items.each do |item|
      if item.bids != {}
        item.bids.each do |bid|
          #budget is calculated wrong in this hash
          budget_and_items[:budget] = bid.first.budget
          bidders.each do |bidder|
            if bid[0].name == bidder
              items_bid_on << item
            end
          end
          info_of_bidders[bid.first] = budget_and_items
        end
      end
      budget_and_items[:items] = items_bid_on.uniq
    end
    info_of_bidders
  end
end