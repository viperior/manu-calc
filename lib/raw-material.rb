class RawMaterial
  attr_reader :item_name, :quantity

  def initialize(item_name, quantity)
    @item_name = item_name
    @quantity = quantity
  end

  def show
    puts "#{@item_name} x#{@quantity}"
  end
end
