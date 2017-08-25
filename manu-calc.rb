require 'json'
require_relative 'create-recipe-file.rb'

def include_library
  directory = Dir.pwd + '/lib/' # Working directory + path to library
  ruby_files = Dir[directory + '*.rb'] # Array of ruby file paths
  ruby_files.each {|file| require file} # Include all ruby files
end

def dashed_line
  dashed_line = ''
  21.times {
    dashed_line += '- '
  }
  return dashed_line
end

def show_recipe(recipe_list, recipe_name)
  if( !recipe_list.recipes[recipe_name].nil? )
    recipe_list.recipes[recipe_name].show
  else
    puts "Invalid recipe name: #{recipe_name}"
  end
end

def show_section_header(text)
  puts "#{dashed_line}\n- \t#{text}\t-\n#{dashed_line}"
end

def main
  include_library
  create_recipe_file
  show_section_header('Manufacturing Calculator')
  recipe_list = RecipeList.new
  recipe_list.load_recipes_from_json_file('data/recipes.json')

  loop do
    puts 'Type recipe name and press ENTER. Type \'quit\' to exit.'
    input = gets.chomp.to_s
    break if input == 'quit'
    show_recipe(recipe_list, input)
    puts "\n"
  end
end

main
