# app/facades/user_facade.rb

require 'faraday'

class UserFacade
  def self.find_or_create_user(auth_hash)
    # binding.pry
    params = {
      'email': auth_hash['info']['email'],
      'first_name': auth_hash['info']['first_name'],
      'last_name': auth_hash['info']['last_name']
    }
    user = UserService.create_or_update_user(params)
    
    User.new(user[:data][:attributes])
  end

#edge case - how many recipes can a user like?
  def self.get_user_recipes(params)
    user = UserService.create_or_update_user(params)
    likes = user[:data][:attributes][:likes]
    recipes = []

    likes.each do |recipe_id|
      recipes << Recipe.new(RecipeService.get_single_recipe_details(recipe_id))
    end
    recipes
  end
end
