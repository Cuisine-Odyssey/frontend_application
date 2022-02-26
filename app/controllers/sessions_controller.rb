# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    @user = UserFacade.find_or_create_user(auth_hash)
    require "pry"; binding.pry
    session[:access_token] = auth_hash['credentials']['token']
    redirect_to root_path
  end
end
