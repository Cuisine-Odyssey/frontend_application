class CocktailFacade
  def self.get_random_cocktail
    cocktail = CocktailService.search_random_cocktail
    Cocktail.new(cocktail[:drinks][0])
  end

  def self.add_cocktail_like(custom_params)
    like_response = CocktailService.add_cocktail_like(custom_params)
    JSON.parse(like_response.body, symbolize_names: true)
  end
end
