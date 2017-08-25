class Recipe
  attr_reader :raw_material_manifest

  def initialize(product)
    @components = []
    @product = product
    @raw_material_manifest = {}
    @raw_materials = []
  end

  def add_component(component, quantity)
    quantity = next_highest_integer(quantity)
    quantity.times {
      @components.push(component)
      add_external_raw_material_manifest(component.raw_material_manifest)
    }
  end

  def add_external_raw_material_manifest(external_raw_material_manifest)
    external_raw_material_manifest.each { |key, value|
      add_item_to_raw_material_manifest(key, value)
    }
  end

  def add_item_to_raw_material_manifest(item_name, quantity)
    @raw_material_manifest[item_name] = current_quantity_of_item_in_raw_material_manifest(item_name) + quantity
  end

  def add_raw_material(raw_material, quantity)
    quantity = next_highest_integer(quantity)
    quantity.times {
      @raw_materials.push(raw_material)
      add_item_to_raw_material_manifest(raw_material.item_name, raw_material.quantity)
    }
  end

  def create_raw_material_manifest
    @raw_materials.each do |raw_material|
      add_item_to_raw_material_manifest(raw_material.item_name, raw_material.quantity)
    end

    @components.each do |component|
      add_external_raw_material_manifest(component.raw_material_manifest)
    end
  end

  def current_quantity_of_item_in_raw_material_manifest(item_name)
    if( item_exists_in_raw_material_manifest(item_name) )
      return @raw_material_manifest[item_name]
    else
      return 0.0
    end
  end

  def is_integer(value)
    return value % 1 == 0
  end

  def item_exists_in_raw_material_manifest(item_name)
    return @raw_material_manifest.has_key? item_name
  end

  def next_highest_integer(value)
    if( is_integer(value) )
      return value.to_i
    else
      return value.ceil.to_i
    end
  end

  def show
    puts "Recipe: #{@product}"
    @raw_material_manifest.each { |key, value|
      puts "#{value.ceil}x #{key}"
    }
  end
end
