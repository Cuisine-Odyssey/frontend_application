class RecipeFacade
  def self.get_random_recipe
    meal = RecipeService.get_random_recipe
    Recipe.new(meal)
  end
end
