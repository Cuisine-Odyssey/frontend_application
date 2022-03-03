class RecipeFacade
  def self.get_random_recipe
    recipe = RecipeService.get_random_recipe
    Recipe.new(recipe)
  end

  def self.get_five_recipes(region)
    recipe_data = RecipeService.get_five_recipes(region)
    recipe_data.map do |recipe|
      FiveRecipe.new(recipe)
    end
  end

  def self.get_single_recipe_details(recipe_id)
    recipe_data = RecipeService.get_single_recipe_details(recipe_id)
    Recipe.new(recipe_data)
  end

  def self.add_recipe_vote(custom_params)
    like_response = RecipeService.send_recipe_vote(custom_params)
    JSON.parse(like_response.body, symbolize_names: true)
  end
end
