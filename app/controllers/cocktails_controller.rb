class CocktailsController < ApplicationController
  def index
    @cocktail = CocktailFacade.get_random_cocktail
  end

  # def like
  #
  #
  #   # redirect_to "/cocktails/#{internal_cocktail_data[:data][:attributes][:cocktail_api_id]}"
  #   redirect_to action: :show
  # end

  def show
    # if params[:like] == true
    #   @choice == 'like'
    custom_params = {
       'cocktail_api_id': params[:id],
       'email': params[:email],
       'vote': 'like'
     }
     internal_cocktail_data = CocktailFacade.add_cocktail_like(custom_params)
    @cocktail = CocktailFacade.get_cocktail(params[:id])
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
