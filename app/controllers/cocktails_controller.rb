class CocktailsController < ApplicationController
  def index
    @cocktail = CocktailFacade.get_random_cocktail
  end

  def show
    if params[:vote] == nil
      return @cocktail = CocktailFacade.get_cocktail(params[:id])
    end
    
    custom_params = {
       'cocktail_api_id': params[:id],
       'email': params[:email],
       'vote': params[:vote]
     }
    internal_cocktail_data = CocktailFacade.add_cocktail_vote(custom_params)
    @cocktail = CocktailFacade.get_cocktail(params[:id])

    if params[:vote] == 'like'
      @choice = 'You have liked this cocktail!'
    elsif params[:vote] == 'dislike'
      @choice = 'Hangover Avoided!'
    end
  end
end
