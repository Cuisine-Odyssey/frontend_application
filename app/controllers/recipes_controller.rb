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

    response = Faraday.post("http://localhost:3000/api/v1/recipes/create") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(custom_params)
    end

    x = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  def dislike

  end
  
end
