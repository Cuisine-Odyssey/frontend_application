class Cocktail
  attr_reader :name,
              :api_id,
              :image,
              :instructions,
              :ingredients,
              :measurements,
              :cocktail_hash

  def initialize(data)
    @name = data[:strDrink]
    @api_id = data[:idDrink]
    @image = data[:strDrinkThumb]
    @instructions = data[:strInstructions]
    @ingredients = drink_ingredients(data)
    @measurements = drink_measurements(data)
    @cocktail_hash = create_cocktail_hash
  end

  def create_cocktail_hash
    @ingredients.zip(@measurements).to_h
  end

  def drink_ingredients(data)
    i_hash = data.select { |ing| ing.start_with? 'strIngredient' }.delete_if { |k, v| v.nil? || v.empty? }
    i_hash.values
  end

  def drink_measurements(data)
    a_hash = data.select { |ing| ing.start_with? 'strMeasure' }.delete_if { |k, v| v.nil? || v.empty? }
    a_hash.values
  end
end
