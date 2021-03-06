# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    @user = UserFacade.find_or_create_user(auth_hash)

    session[:access_token] = auth_hash['credentials']['token']
    session[:email] = auth_hash[:info][:email]
    session[:first_name] = auth_hash[:info][:first_name]
    session[:last_name] = auth_hash[:info][:last_name]

    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
