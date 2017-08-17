require 'json'

def create_recipe_file
  raw_recipes = [
    ['Gold Plate', 'Gold Ingot', 1],
    ['Copper Plate', 'Copper Ingot', 1],
    ['Tin Plate', 'Tin Ingot', 1],
    ['Iron Plate', 'Iron Ingot', 1],
    ['Copper Wire', 'Copper Ingot', (1.0 / 3.0)],
    ['Tin Item Casing', 'Tin Ingot', (1.0 / 2.0)],
    ['Iron Bars', 'Iron Ingot', (6.0 / 24.0)],
    ['Coil', 'Copper Wire', 8, 'Iron Ingot', 1],
    ['Electric Motor', 'Tin Item Casing', 2, 'Coil', 2, 'Iron Ingot', 1],
    ['Heat Vent', 'Iron Bars', 4, 'Iron Plate', 4, 'Electric Motor', 1],
    ['Reactor Heat Vent', 'Copper Plate', 8, 'Heat Vent', 1],
    ['Overclocked Heat Vent', 'Gold Plate', 4, 'Reactor Heat Vent', 1],
    ['Component Heat Vent', 'Iron Bars', 4, 'Tin Plate', 4, 'Heat Vent', 1],
    ['Reactor Setup', 'Overclocked Heat Vent', 14, 'Reactor Heat Vent', 12, 'Component Heat Vent', 25]
  ]

  recipes = {}

  raw_recipes.each do |recipe_data|
    recipe = {}
    product = recipe_data[0]
    ingredient_count = (recipe_data.size - 1) / 2
    c = 1

    ingredient_count.times {
      ingredient_name = recipe_data[c]
      ingredient_quantity = recipe_data[c + 1]
      c += 2
      recipe[ingredient_name] = ingredient_quantity
    }

    recipes[product] = recipe
  end

  recipes_json = recipes.to_json

  File.open('data/recipes.json', 'w') do |f|
    f.write(recipes_json)
  end
end

create_recipe_file
