require 'json'

def create_recipe_file
  raw_recipes = [
    ['Gold Plate', 'Gold Ingot', 1.0],
    ['Copper Plate', 'Copper Ingot', 1.0],
    ['Tin Plate', 'Tin Ingot', 1.0],
    ['Iron Plate', 'Iron Ingot', 1.0],
    ['Copper Wire', 'Copper Ingot', (1.0 / 3.0)],
    ['Tin Item Casing', 'Tin Ingot', (1.0 / 2.0)],
    ['Iron Bars', 'Iron Ingot', (6.0 / 24.0)],
    ['Coil', 'Copper Wire', 8.0, 'Iron Ingot', 1.0],
    ['Electric Motor', 'Tin Item Casing', 2.0, 'Coil', 2.0, 'Iron Ingot', 1.0],
    ['Heat Vent', 'Iron Bars', 4.0, 'Iron Plate', 4.0, 'Electric Motor', 1.0],
    ['Reactor Heat Vent', 'Copper Plate', 8.0, 'Heat Vent', 1.0],
    ['Overclocked Heat Vent', 'Gold Plate', 4.0, 'Reactor Heat Vent', 1.0],
    ['Component Heat Vent', 'Iron Bars', 4.0, 'Tin Plate', 4.0, 'Heat Vent', 1.0],
    ['Reactor Setup', 'Overclocked Heat Vent', 14.0, 'Reactor Heat Vent', 12.0, 'Component Heat Vent', 25.0],
    ['Gravel', 'Cobblestone', 1.0],
    ['Flint', 'Gravel', 3.0],
    ['Scrap', 'Cobblestone', 8.0],
    ['mB UU-Matter', 'Scrap', 1.0, 'EU', 166666.0],
    ['B UU-Matter', 'mB UU-Matter', 1000.0],
    ['Coal Dust', 'Coal', 1.0],
    ['Coal Ball', 'Coal Dust', 8.0, 'Flint', 1.0],
    ['Compressed Coal Ball', 'Coal Ball', 1.0],
    ['Coal Chunk', 'Compressed Coal Ball', 8.0, 'Obsidian', 1.0],
    ['Diamond', 'Coal Chunk', 1.0]
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
