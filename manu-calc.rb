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

  #gold_plate = Blueprint.new('Gold Plate', 1)
  #gold_plate.add_raw_material('Gold Ingot', 1)
  #gold_plate.display_raw_materials

  #overclocked_heat_vent = Blueprint.new('Overclocked Heat Vent', 1)
  #overclocked_heat_vent.add_component(gold_plate, 4)
  #overclocked_heat_vent.display_components
  #overclocked_heat_vent.display_raw_materials

  #reactor_build = Blueprint.new('Reactor Build', 1)
  #reactor_build.add_component(overclocked_heat_vent, 14)
  #reactor_build.display_components
  #reactor_build.display_raw_materials

  #gold_ingot = Ingredient.new('Gold Ingot', false)
  #gold_ingot_line_item = BlueprintLineItem.new(gold_ingot, 1)

  #gold_plate = Ingredient.new('Gold Plate', true)
  #gold_plate.add_blueprint_line_item(gold_ingot_line_item)
  #gold_plate_line_item = BlueprintLineItem.new(gold_plate, 4)

  #gold_plate_line_item.display_blueprint_line_items

  gold_ingot = ['Gold Ingot', 1]
  gold_ingot_line_item = [gold_ingot, 1]
  gold_plate = []

  gold_plate.push(gold_ingot_line_item)
end

main
