class CocktailsController < ApplicationController
  def index
    @cocktail = CocktailFacade.get_random_cocktail
    render partial: 'info'
  end

  def like
    custom_params = {
      'cocktail_api_id': params[:id],
      'email': params[:email],
      'vote': 'like'
    }

    require "pry"; binding.pry
    cocktail = CocktailFacade.add_cocktail_like(custom_params)
    # render partial: 'like'
    @like = true
    render partial: 'info'
    # redirect_to "/cocktails/#{cocktail[:data][:attributes][:cocktail_api_id]}"
  end

  # def dislike
  #   custom_params = {
  #     'cocktail_api_id': params[:id],
  #     'email': params[:email],
  #     'vote': 'like'
  #   }
  #
  #   CocktailFacade.add_cocktail_dislike(custom_params)
  #   render partial: 'dislike'
  #   @dislike = true
  # end
end
