class UsersController < ApplicationController

  def show
    hash = {
      'email' => session['email'],
      'first_name' => session['first_name'],
      'last_name' => session['last_name']
      }
      # binding.pry
    @recipes = UserFacade.get_user_recipes(hash)
    # binding.pry
  end

end
