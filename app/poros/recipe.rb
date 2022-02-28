class Recipe
  attr_reader :recipe_id, :title, :location, :instructions

  def initialize(meals)
    @recipe_id = meals[:idMeal]
    @title = meals[:strMeal]
    @location = meals[:strArea]
    @instructions = meals[:strInstructions]
  end
end
