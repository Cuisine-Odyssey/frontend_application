# spec/services/user_service_spec.rb
require 'rails_helper'

RSpec.describe 'User Service' do
  xit 'creates a connection to Faraday' do
    user = instance_double("user", first_name:"Chewie", last_name: 'Bacca', email: 'wookie@gmail.com')
    
    allow(UserFacade).to receive(:get_user_by_email).and_return(user)
    binding.pry
    user_service = UserService.get_user_by_email(:user.email)
  end
end
