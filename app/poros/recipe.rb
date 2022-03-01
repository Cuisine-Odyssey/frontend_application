class Recipe
  attr_reader :recipe_id, :title, :location, :instructions, :ingredients, :amounts, :combined, :image

  def initialize(meals)
    @recipe_id = meals[:meals][0][:idMeal]
    @title = meals[:meals][0][:strMeal]
    @location = meals[:meals][0][:strArea]
    @instructions = meals[:meals][0][:strInstructions]
    @image = meals[:meals][0][:strMealThumb]

    i_hash = meals[:meals][0].select { |ing| ing.start_with? 'strIngredient' }.delete_if { |_k, v| v.nil? || v.empty? }
    @ingredients = i_hash.values

    a_hash = meals[:meals][0].select { |amt| amt.start_with? 'strMeasure' }.delete_if { |_k, v| v.nil? || v.empty? }
    @amounts = a_hash.values

    @combined = Hash[@ingredients.zip(@amounts)]
  end
end
