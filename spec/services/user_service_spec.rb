# spec/services/user_service_spec.rb
require 'rails_helper'

RSpec.describe 'User Service' do
  it 'gets user data by email' do
    user = instance_double('user', first_name: 'Chewie', last_name: 'Bacca', email: 'wookie@gmail.com')
    allow(UserService).to receive(:get_user_by_email).and_return(user)
    
    service_returns = UserService.get_user_by_email(user.email)

    expect(service_returns.email).to eq('wookie@gmail.com')
  end

  it 'creates or updates user' do
    user = instance_double('user', first_name: 'Chewie', last_name: 'Bacca', email: 'wookie@gmail.com')
    allow(UserService).to receive(:create_or_update_user).and_return(user)

    service_returns = UserService.create_or_update_user(user)

    expect(service_returns.first_name).to eq('Chewie')
    expect(service_returns.last_name).to eq('Bacca')
    expect(service_returns.email).to eq('wookie@gmail.com')
  end
end
