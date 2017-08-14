class Blueprint
  attr_reader :name, :quantity, :total_raw_materials

  def initialize(name, quantity)
    @components = []
    @name = name
    @quantity = quantity
    @raw_materials = []
    @total_raw_materials = []
  end

  def add_component(blueprint, quantity)
    component = Blueprint.new(blueprint.name, quantity)
    @components.push(component)

    component.total_raw_materials.each do |raw_material|
      @total_raw_materials.push(raw_material)
    end
  end

  def add_raw_material(name, quantity)
    raw_material = RawMaterial.new(name, quantity)
    @raw_materials.push(raw_material)
    @total_raw_materials.push(raw_material)
  end

  def display_components
    puts "Components for #{@name}:\n"

    @components.each do |component|
      puts "#{component.name}\t#{component.quantity}"
    end

    puts "\n"
  end

  def display_raw_materials
    puts "Raw materials for #{@name}:\n"

    @total_raw_materials.each do |raw_material|
      puts "#{raw_material.name}\t#{raw_material.quantity}"
    end

    puts "\n"
  end
end
