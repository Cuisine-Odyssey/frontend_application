# app/facades/user_facade.rb

require 'faraday'

class UserFacade
  def self.find_or_create_user(auth_hash)
    # binding.pry
    params = {
      'email': auth_hash['info']['email'],
      'first_name': auth_hash['info']['first_name'],
      'last_name': auth_hash['info']['last_name']
    }

    user = UserService.get_user(params)
    User.new(user[:data][:attributes])
  end

  def self.get_user_by_id(id)
    UserService.get_user_by_id(id)
  end
end
