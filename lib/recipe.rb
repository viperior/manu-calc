class Recipe
  attr_reader :raw_material_manifest

  def initialize(product)
    @components = []
    @product = product
    @raw_material_manifest = {}
    @raw_materials = []
  end

  def add_component(component, quantity)
    quantity.times {
      @components.push(component)
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
    quantity.times {
      @raw_materials.push(raw_material)
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

  def item_exists_in_raw_material_manifest(item_name)
    return @raw_material_manifest.has_key? item_name
  end

  def show
    @components.each do |component|
      component.show
    end

    @raw_materials.each do |raw_material|
      raw_material.show
    end
  end
end
