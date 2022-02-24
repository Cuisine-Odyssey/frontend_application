# spec/services/user_service_spec.rb

require 'rails_helper'

RSpec.describe 'User Service' do
  it 'returns a User after auth' do
    id = '10'
    user_data = UserService.get_user(id)
    expect(user_data).to be_a Hash
    expect(user_data[:data]).to be_a Hash
    expect(user_data[:data]).to have_key :first_name
    expect(user_data[:data]).to have_key :last_name
    expect(user_data[:data]).to have_key :email
    expect(user_data[:data]).to have_key :liked_cocktails
  end
end
