class ApplicationController < ActionController::Base
  helper_method :current_user

  # def current_user
  #   User.find(session[:user_id]) if session[:user_id]
  # end

  def current_user#ask erin
    if session[:user_id]#can we send lots of user data with sessions
      User.new(session_data)
    end
  end
  # def require_user
  #   if !current_user
  #     flash[:alert] = 'Login Required!'
  #     redirect_to root_path
  #   end
  # end
end
