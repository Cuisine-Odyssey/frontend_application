# spec/services/user_service_spec.rb

require 'rails_helper'

RSpec.describe 'User Service' do
  it 'user id is valid and found by the backend' do
    VCR.use_cassette('user_service_finds_user_10') do
      id = '10'
      user_data = UserService.get_user_by_id(id)
      expect(user_data).to be_a Hash
      expect(user_data[:data]).to be_a Hash
      expect(user_data[:data][:attributes]).to have_key :first_name
      expect(user_data[:data][:attributes]).to have_key :last_name
      expect(user_data[:data][:attributes]).to have_key :email
      expect(user_data[:data][:attributes]).to have_key :likes
    end
  end
  it 'returns a faraday response from backend', :vcr do
      backend_conn = UserService.backend_conn
      expect(backend_conn).to be_a(Faraday::Connection)
  end

  it 'returns a users recipes', :vcr do
      id = '10'
      user_recipes = UserService.get_user_recipe(10)
      binding.pry
      expect(user_recipes).to be_a Hash
      # expect(random_recipe[:meals]).to be_a Array
      # expect(random_recipe[:meals][0]).to have_key :idMea
  end


end
