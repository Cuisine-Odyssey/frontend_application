# app/controllers/recipes_controller.rb
class RecipesController < ApplicationController
  def index
    @one_recipe = RecipeFacade.get_random_recipe
    @five_recipes = RecipeFacade.get_five_recipes(@one_recipe.location)
  end

  def show

  end

  def show
    @recipe = RecipeFacade.get_single_recipe_details(params[:id])
  end
end
