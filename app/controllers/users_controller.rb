class UsersController < ApplicationController

  def show
    hash =
    # { 'info' =>
      {
      'email' => session['email'],
      'first_name' => session['first_name'],
      'last_name' => session['last_name']
      }
    # }

    # @user = UserFacade.find_or_create_user(hash)
    @recipes = UserFacade.get_user_recipes(hash)
    require "pry"; binding.pry
  end

end
