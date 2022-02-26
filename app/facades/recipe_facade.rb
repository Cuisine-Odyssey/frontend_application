class RecipeFacade
  def self.get_random_recipe
    meal = RecipeService.get_random_recipe
    Recipe.new(meal)
  end

  def self.get_five_recipes
    recipe_data = RecipeService.get_five_recipes
    recipe_data.map do |recipe|
      Recipe.new(recipe)
    end
  end 
end
