# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']

    binding.pry
    @user = UserFacade.find_or_create_user(email: email)
    session[:access_token] = auth_hash['credentials']['token']
    redirect_to root_path
  end
end
