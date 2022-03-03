# app/controllers/recipes_controller.rb
class RecipesController < ApplicationController
  def index
    @one_recipe = RecipeFacade.get_random_recipe
    @five_recipes = RecipeFacade.get_five_recipes(@one_recipe.location)
  end

  def show
    @recipe = RecipeFacade.get_single_recipe_details(params[:id])
  end

  def vote

    custom_params = {
      'recipe_api_id': params[:id],
      'email': params[:email],
      'vote': params[:vote]
    }
    @response = RecipeFacade.add_recipe_vote(custom_params)
    @recipe = RecipeFacade.get_single_recipe_details(params[:id])

    if params[:vote] == 'like'
      @choice = 'You have liked this recipe!'
    elsif params[:vote] == 'dislike'
      @choice = 'Ew Gross!!'
    end
  end
end
