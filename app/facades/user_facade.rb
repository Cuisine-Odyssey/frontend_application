# app/facades/user_facade.rb

require 'faraday'

class UserFacade
  def self.find_or_create_user(email)
    user = UserService.get_user_by_email(email)
    User.new(user[:data])
  end

  def self.get_user(id)
    UserService.get_user(id)
  end
end
