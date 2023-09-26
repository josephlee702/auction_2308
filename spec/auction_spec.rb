require './spec/spec_helper'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@auction).to be_a(Auction)
      expect(@auction.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds items to the auction' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe '#unpopular_items and potential revenue' do
    it 'gives items that have no bids on them and potential revenue of the auction, respectively' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
      expect(@auction.potential_revenue).to eq(87)
      #extra tests
      @item1.add_bid(@attendee5, 100)
      expect(@item1.current_high_bid).to eq(100)
      expect(@auction.potential_revenue).to eq(165)
      @item5.add_bid(@attendee2, 35)
      expect(@auction.unpopular_items).to eq([@item2])
      expect(@auction.potential_revenue).to eq(200)
    end
  end

  describe '#bidders' do
    it 'lists all attendees who have bid on an item' do
      expect(@auction.items).to eq([])
      expect(@auction.bidders).to eq([])
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      expect(@auction.items).to eq([@item1, @item2, @item3])
      @item1.add_bid(@attendee1, 20)
      @item1.add_bid(@attendee2, 30)
      @item2.add_bid(@attendee1, 50)
      @item2.add_bid(@attendee2, 100)
      @item3.add_bid(@attendee1, 5)
      expect(@item1.bids).to eq({@attendee1 => 20, @attendee2 => 30})
      expect(@auction.bidders).to eq(["Megan", "Bob"])
      @item3.add_bid(@attendee3, 7)
      expect(@item3.bids).to eq({@attendee1 => 5, @attendee3 => 7})
      expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
    end
  end

  # describe '#bidder_info' do
  #   it 'returns a hash with attendees, their budget, and what items they bid on ' do
  #     @auction.add_item(@item1)
  #     @auction.add_item(@item2)
  #     @auction.add_item(@item3)
  #     @item1.add_bid(@attendee1, 20)
  #     @item1.add_bid(@attendee2, 30)
  #     @item2.add_bid(@attendee2, 50)
  #     @item2.add_bid(@attendee2, 100)
  #     @item3.add_bid(@attendee1, 5)

  #     expect().to eq()
  #   end
  # end
end