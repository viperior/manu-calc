class BlueprintLineItem
  def initialize(ingredient, quantity)
    @ingredient = ingredient
    @quantity = quantity
  end

  def display_blueprint_line_items
    puts "Blueprint line items for #{@name}"

    @blueprint_line_items.each do |blueprint_line_item|
      puts "#{blueprint_line_item.name}\t#{blueprint_line_item.quantity}"
    end
  end
end
