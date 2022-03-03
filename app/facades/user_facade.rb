# app/facades/user_facade.rb

require 'faraday'

class UserFacade
  def self.find_or_create_user(auth_hash)
<<<<<<< HEAD

=======
>>>>>>> bc82f69da6fdbf19be775629060af592e0e47ddc
    params = {
      'email': auth_hash['info']['email'],
      'first_name': auth_hash['info']['first_name'],
      'last_name': auth_hash['info']['last_name']
    }
    user = UserService.create_or_update_user(params)
<<<<<<< HEAD

=======
>>>>>>> bc82f69da6fdbf19be775629060af592e0e47ddc
    User.new(user[:data][:attributes])
  end

  def self.get_user_by_email(email)
    UserService.get_user_by_email(email)
  end

  def self.get_user_recipes(params)
    #change below to just get user info?
    user = UserService.create_or_update_user(params)
    likes = user[:data][:attributes][:recipe_likes]
    recipes = []

    likes.each do |recipe_id|
      recipes << Recipe.new(RecipeService.get_single_recipe_details(recipe_id))
    end
    recipes
  end
end
