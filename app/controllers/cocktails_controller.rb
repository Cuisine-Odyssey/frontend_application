class CocktailsController < ApplicationController
  def index
    @cocktail = CocktailFacade.get_random_cocktail
  end

  def like
    custom_params = {
      'cocktail_api_id': params[:id],
      'email': params[:email],
      'vote': 'like'
    }

  end
end
