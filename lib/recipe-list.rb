class RecipeList
  attr_reader :recipes

  def initialize
    @recipes = {}
  end

  def create_recipe_from_ingredient_list(product, ingredients)
    recipe = Recipe.new(product)

    ingredients.each { |item_name, quantity|
      if( @recipes.has_key? item_name )
        recipe.add_component( @recipes[item_name], quantity )
      else
        recipe.add_raw_material( RawMaterial.new(item_name, quantity), 1 )
      end
    }

    @recipes[product] = recipe
  end

  def load_recipes_from_json_file(file_path)
    file = File.read(file_path)
    data_hash = JSON.parse(file)

    data_hash.each { |product, ingredients|
      @recipes[product] = create_recipe_from_ingredient_list(product, ingredients)
    }
  end
end
