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
    mixins = []
    if data[:strIngredient1] != nil
      mixins.push(data[:strIngredient1])
    end
    if data[:strIngredient2] != nil
      mixins.push(data[:strIngredient2])
    end
    if data[:strIngredient3] != nil
      mixins.push(data[:strIngredient3])
    end
    if data[:strIngredient4] != nil
      mixins.push(data[:strIngredient4])
    end
    if data[:strIngredient5] != nil
      mixins.push(data[:strIngredient5])
    end
    if data[:strIngredient6] != nil
      mixins.push(data[:strIngredient6])
    end
    if data[:strIngredient7] != nil
      mixins.push(data[:strIngredient7])
    end
    if data[:strIngredient8] != nil
      mixins.push(data[:strIngredient8])
    end
    if data[:strIngredient9] != nil
      mixins.push(data[:strIngredient9])
    end
    if data[:strIngredient10] != nil
      mixins.push(data[:strIngredient10])
    end
    if data[:strIngredient11] != nil
      mixins.push(data[:strIngredient11])
    end
    if data[:strIngredient12] != nil
      mixins.push(data[:strIngredient12])
    end
    if data[:strIngredient13] != nil
      mixins.push(data[:strIngredient13])
    end
    if data[:strIngredient14] != nil
      mixins.push(data[:strIngredient14])
    end
    if data[:strIngredient15] != nil
      mixins.push(data[:strIngredient15])
    end
    mixins
  end

  def drink_measurements(data)
    amounts = []
    if data[:strMeasure1] != nil
      amounts.push(data[:strMeasure1])
    end
    if data[:strMeasure2] != nil
      amounts.push(data[:strMeasure2])
    end
    if data[:strMeasure3] != nil
      amounts.push(data[:strMeasure3])
    end
    if data[:strMeasure4] != nil
      amounts.push(data[:strMeasure4])
    end
    if data[:strMeasure5] != nil
      amounts.push(data[:strMeasure5])
    end
    if data[:strMeasure6] != nil
      amounts.push(data[:strMeasure6])
    end
    if data[:strMeasure7] != nil
      amounts.push(data[:strMeasure7])
    end
    if data[:strMeasure8] != nil
      amounts.push(data[:strMeasure8])
    end
    if data[:strMeasure9] != nil
      amounts.push(data[:strMeasure9])
    end
    if data[:strMeasure10] != nil
      amounts.push(data[:strMeasure10])
    end
    if data[:strMeasure11] != nil
      amounts.push(data[:strMeasure11])
    end
    if data[:strMeasure12] != nil
      amounts.push(data[:strMeasure12])
    end
    if data[:strMeasure13] != nil
      amounts.push(data[:strMeasure13])
    end
    if data[:strMeasure14] != nil
      amounts.push(data[:strMeasure14])
    end
    if data[:strMeasure15] != nil
      amounts.push(data[:strMeasure15])
    end
    amounts
  end
end
