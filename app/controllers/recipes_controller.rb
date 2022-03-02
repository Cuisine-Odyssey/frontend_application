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
    # flash[:notice] = 'You have liked this recipe!'
    respond_to do |format|
      format.html {}
      format.js {}
    end
    # render partial: 'like'
  end

  def dislike
    custom_params = {
      'recipe_api_id': params[:id],
      'email': params[:email],
      'vote': 'dislike'
    }

    response = Faraday.post("http://localhost:3000/api/v1/recipes/dislike") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(custom_params)
    end

    JSON.parse(response.body, symbolize_names: true)
  end
  
end
