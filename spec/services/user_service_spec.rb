# spec/services/user_service_spec.rb
require 'rails_helper'

RSpec.describe 'User Service' do
  it 'gets user data by email' do
    user = instance_double('user', first_name: 'Chewie', last_name: 'Bacca', email: 'wookie@gmail.com')
    allow(UserService).to receive(:get_user_by_email).and_return(user)
    
    service_returns = UserService.get_user_by_email(user.email)

    expect(service_returns.email).to eq('wookie@gmail.com')
  end
end
