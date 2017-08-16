class Ingredient
  def initialize(name, craftable)
    @blueprint_line_items = []
    @craftable = craftable
    @name = name
  end

  def add_blueprint_line_item(blueprint_line_item)
    @blueprint_line_items.push(blueprint_line_item)
  end
end
