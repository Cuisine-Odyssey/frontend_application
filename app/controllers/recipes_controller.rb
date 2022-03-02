# app/controllers/recipes_controller.rb
class RecipesController < ApplicationController
  def index
    @one_recipe = RecipeFacade.get_random_recipe
    @five_recipes = RecipeFacade.get_five_recipes(@one_recipe.location)
  end

  def show
    @recipe = RecipeFacade.get_single_recipe_details(params[:id])
  end

  def like
    custom_params = {
      'recipe_api_id': params[:id],
      'email': params[:email],
      'vote': 'like'
    }
    RecipeFacade.add_recipe_like(custom_params)
    render partial: 'like'
    @like = true
  end

  def dislike
    custom_params = {
      'recipe_api_id': params[:id],
      'email': params[:email],
      'vote': 'dislike'
    }

    RecipeFacade.add_recipe_dislike(custom_params)
    render partial: 'dislike'
    @dislike = true
  end
end
