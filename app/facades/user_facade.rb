# app/facades/user_facade.rb

require 'faraday'

class UserFacade
  def self.get_user(id)
    u = UserService.get_user(id)
    @user = User.new(u)
  end
end
