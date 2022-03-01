class Recipe
  attr_reader :recipe_id, :title, :location, :instructions, :image

  def initialize(meals)
    @recipe_id = meals[:meals][0][:idMeal]
    @title = meals[:meals][0][:strMeal]
    @location = meals[:meals][0][:strArea]
    @instructions = meals[:meals][0][:strInstructions]
    @image = meals[:meals][0][:strMealThumb]
  end
end
