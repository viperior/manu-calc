def include_library
  directory = Dir.pwd + '/lib/' # Working directory + path to library
  ruby_files = Dir[directory + '*.rb'] # Array of ruby file paths
  ruby_files.each {|file| require file} # Include all ruby files
end

def main
  include_library

  dashed_line = ''
  21.times {
    dashed_line += '- '
  }
  puts "#{dashed_line}\n- \tManufacturing Calculator\t-\n#{dashed_line}"

  copper_wire_recipe = Recipe.new('Copper Wire')
  copper_wire_recipe.add_raw_material( RawMaterial.new('Copper Ingot', (1.0/3.0)), 1 )
  copper_wire_recipe.create_raw_material_manifest

  coil_recipe = Recipe.new('Coil')
  coil_recipe.add_raw_material( RawMaterial.new('Iron Ingot', 1), 1 )
  coil_recipe.add_component(copper_wire_recipe, 8)
  coil_recipe.create_raw_material_manifest

  tin_item_casing_recipe = Recipe.new('Tin Item Casing')
  tin_item_casing_recipe.add_raw_material( RawMaterial.new('Tin Ingot', 0.5), 1 )
  tin_item_casing_recipe.create_raw_material_manifest

  electric_motor_recipe = Recipe.new('Electric Motor')
  electric_motor_recipe.add_component(tin_item_casing_recipe, 2)
  electric_motor_recipe.add_component(coil_recipe, 2)
  electric_motor_recipe.add_raw_material( RawMaterial.new('Iron Ingot', 1), 1 )
  electric_motor_recipe.create_raw_material_manifest

  iron_plate_recipe = Recipe.new('Iron Plate')
  iron_plate_recipe.add_raw_material( RawMaterial.new('Iron Ingot', 1), 1 )
  iron_plate_recipe.create_raw_material_manifest

  iron_bars_recipe = Recipe.new('Iron Bars')
  iron_bars_recipe.add_raw_material( RawMaterial.new('Iron Ingot', (6.0 / 24.0)), 1 )
  iron_bars_recipe.create_raw_material_manifest

  heat_vent_recipe = Recipe.new('Heat Vent')
  heat_vent_recipe.add_component(iron_bars_recipe, 4)
  heat_vent_recipe.add_component(iron_plate_recipe, 4)
  heat_vent_recipe.add_component(electric_motor_recipe, 1)
  heat_vent_recipe.create_raw_material_manifest

  copper_plate_recipe = Recipe.new('Copper Plate')
  copper_plate_recipe.add_raw_material( RawMaterial.new('Copper Ingot', 1), 1 )
  copper_plate_recipe.create_raw_material_manifest

  reactor_heat_vent_recipe = Recipe.new('Reactor Heat Vent')
  reactor_heat_vent_recipe.add_component(copper_plate_recipe, 8)
  reactor_heat_vent_recipe.add_component(heat_vent_recipe, 1)
  reactor_heat_vent_recipe.create_raw_material_manifest

  gold_plate_recipe = Recipe.new('Gold Plate')
  gold_plate_recipe.add_raw_material( RawMaterial.new('Gold Ingot', 1), 1 )
  gold_plate_recipe.create_raw_material_manifest

  overclocked_heat_vent_recipe = Recipe.new('Overclocked Heat Vent')
  overclocked_heat_vent_recipe.add_component(gold_plate_recipe, 4)
  overclocked_heat_vent_recipe.add_component(reactor_heat_vent_recipe, 1)
  overclocked_heat_vent_recipe.create_raw_material_manifest

  tin_plate_recipe = Recipe.new('Tin Plate')
  tin_plate_recipe.add_raw_material( RawMaterial.new('Tin Ingot', 1), 1 )
  tin_plate_recipe.create_raw_material_manifest

  component_heat_vent_recipe = Recipe.new('Component Heat Vent')
  component_heat_vent_recipe.add_component(iron_bars_recipe, 4)
  component_heat_vent_recipe.add_component(tin_plate_recipe, 4)
  component_heat_vent_recipe.add_component(heat_vent_recipe, 1)
  component_heat_vent_recipe.create_raw_material_manifest

  reactor_setup_recipe = Recipe.new('Reactor Setup')
  reactor_setup_recipe.add_component(overclocked_heat_vent_recipe, 14)
  reactor_setup_recipe.add_component(reactor_heat_vent_recipe, 12)
  reactor_setup_recipe.add_component(component_heat_vent_recipe, 25)
  reactor_setup_recipe.create_raw_material_manifest

  puts reactor_setup_recipe.raw_material_manifest
end

main
