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
end