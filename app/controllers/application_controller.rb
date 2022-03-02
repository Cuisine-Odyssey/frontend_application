class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    
    session[:access_token].present? && UserFacade.get_user_by_email(session[:email])
  end

  def user
    User.find(session[:user_id]) if session[:user_id]
  end

  # def require_userbun
  #   if !current_user
  #     flash[:alert] = 'Login Required!'
  #     redirect_to root_path
  #   end
  # end
end
