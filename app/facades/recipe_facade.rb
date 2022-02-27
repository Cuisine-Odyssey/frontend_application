class RecipeFacade
  def self.get_random_recipe
    recipe = RecipeService.get_random_recipe
    Recipe.new(recipe)
  end

  def self.get_five_recipes(region)
    recipe_data = RecipeService.get_five_recipes(region)
    recipe_data.map do |recipe|
      Recipe.new(recipe)
    end
  end
end
