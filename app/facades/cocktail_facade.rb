class CocktailFacade
  def self.get_random_cocktail
    cocktail = CocktailService.search_random_cocktail
    Cocktail.new(cocktail[:drinks][0])
  end
end
