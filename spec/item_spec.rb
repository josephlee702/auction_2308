require './spec/spec_helper'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @attendee1 = attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    
    @auction = Auction.new

    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
      expect(@item1.name).to eq("Chalkware Piggy Bank")
      expect(@item2.name).to eq('Bamboo Picture Frame')
    end
  end

  describe '#add_bid' do
    it 'adds an attendees bid to the item' do
      expect(@item1.bids).to eq({})
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end
  end

  describe '#current_high_bid' do
    it 'returns the highest bid of an item' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
      @item4.add_bid(@attendee3, 50)
      expect(@item4.bids).to eq({@attendee3 => 50})
      expect(@item4.current_high_bid).to eq(50)
    end
  end
end