class FiveRecipe
  attr_reader :recipe_id, :image, :title

  def initialize(data)
    @recipe_id = data[:idMeal]
    @image = data[:strMealThumb]
    @title = data[:strMeal]
  end
end
