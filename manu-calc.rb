require 'json'

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

  recipe_list = RecipeList.new
  recipe_list.load_recipes_from_json_file('data/recipes.json')

  recipe_list.recipes['Reactor Setup'].show
end

main
