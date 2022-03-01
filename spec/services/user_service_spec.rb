# spec/services/user_service_spec.rb

require 'rails_helper'

RSpec.describe 'User Service' do
  # it 'user id is valid and found by the backend' do
  #   VCR.use_cassette('user_service_finds_user_10') do
  #     id = '10'
  #     user_data = UserService.get_user_by_id(id)
  #     expect(user_data).to be_a Hash
  #     expect(user_data[:data]).to be_a Hash
  #     expect(user_data[:data][:attributes]).to have_key :first_name
  #     expect(user_data[:data][:attributes]).to have_key :last_name
  #     expect(user_data[:data][:attributes]).to have_key :email
  #     expect(user_data[:data][:attributes]).to have_key :likes
  #   end
  # end
end
