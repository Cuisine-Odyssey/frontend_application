# app/poros/user.rb

class User
  attr_reader :first_name, :last_name, :email, :liked_recipes, :disliked_recipes

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @email = attributes[:email]
    @liked_recipes = attributes[:likes]
    @disliked_recipes = attributes[:dislikes]
  end
end
