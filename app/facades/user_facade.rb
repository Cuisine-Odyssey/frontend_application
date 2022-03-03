# app/facades/user_facade.rb

require 'faraday'

class UserFacade
  def self.find_or_create_user(auth_hash)
    params = {
      'email': auth_hash['info']['email'],
      'first_name': auth_hash['info']['first_name'],
      'last_name': auth_hash['info']['last_name']
    }
    user = UserService.create_or_update_user(params)
    User.new(user[:data][:attributes])
  end

  def self.get_user_by_email(email)
    UserService.get_user_by_email(email)
  end

  def self.get_user_recipes(params)
    #change below to just get user info?
    user = UserService.create_or_update_user(params)
    recipe_ids = user[:data][:attributes][:recipe_likes]
    recent_likes = recipe_ids.last(5)
    recipes = []

    recent_likes.each do |recipe_id|
      recipes << Recipe.new(RecipeService.get_single_recipe_details(recipe_id))
    end
    recipes
  end

  def self.get_user_cocktails(params)
    user = UserService.create_or_update_user(params)
    cocktail_ids = user[:data][:attributes][:cocktail_likes]
    recent_likes = cocktail_ids.last(5)
    cocktails = []

    recent_likes.each do |cocktail_id|
      cocktail = CocktailService.get_cocktail_data(cocktail_id)
      cocktails << Cocktail.new(cocktail[:drinks][0])
    end
    cocktails
  end
end
