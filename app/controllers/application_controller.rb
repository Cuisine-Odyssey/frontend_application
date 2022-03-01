class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    session[:access_token].present? && UserFacade.find_or_create_user({ 'info' => { 'email': session[:email] } })
  end

  # def current_user
  #   User.find(session[:user_id]) if session[:user_id]
  # end

  # def require_user
  #   if !current_user
  #     flash[:alert] = 'Login Required!'
  #     redirect_to root_path
  #   end
  # end
end
