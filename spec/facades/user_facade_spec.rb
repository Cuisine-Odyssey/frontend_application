# app/spec/facades/user_facade_spec.rb

require 'rails_helper'

RSpec.describe 'User Facade' do
  scenario 'user exists and is returned by the backend' do
    VCR.use_cassette('.find_or_create_user(auth_hash)') do
      auth_hash = { 'info' =>
                    {
                      'email' => 'TheOtherOne@gmail.com',
                      'first_name' => 'Bob',
                      'last_name' => 'Weir'
                    }
                  }

      user = UserFacade.find_or_create_user(auth_hash)
      expect(user).to be_a User
    end

    # VCR.use_cassette('.get_user(id)') do
    #   user = UserFacade.get_user_by_id('10')
    #   expect(user).to be_a Hash
    # end
  end

  scenario 'user does not yet exist in the database; oauth2 provides data to create new User' do
    VCR.use_cassette('new_find_or_create_user(auth_hash)') do
      auth_hash = { 'info' =>
                    {
                      'email' => 'OneMore@gmail.com',
                      'first_name' => 'Babs',
                      'last_name' => 'Weir'
                    }
                  }

      user = UserFacade.find_or_create_user(auth_hash)
      expect(user).to be_a User
    end
  end

  it 'returns a users recipes', :vcr do
    params = {
        'email': 'chuck@gmail.com',
        'first_name': 'Chuck',
        'last_name': 'Norris'
      }

    user_recipes = UserFacade.get_user_recipes(params)

    expect(user_recipes).to be_an Array

    user_recipes.each do |recipe|
      expect(recipe).to be_a Recipe
    end
  end
end
