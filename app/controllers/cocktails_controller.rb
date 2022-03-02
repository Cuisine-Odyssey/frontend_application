class CocktailsController < ApplicationController
  def index
    @cocktail = CocktailFacade.get_random_cocktail
  end
end
