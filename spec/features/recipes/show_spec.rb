# app/spec/features/recipes/show_spec.rb

require 'rails_helper'

RSpec.describe 'Recipe Show Page', type: :feature do

  context 'receives a valid recipe id' do
    it 'can view recipe details', :vcr do
      visit '/recipes/52772'

      expect(page).to have_content('Teriyaki Chicken Casserole')
      expect(page).to have_content('Japanese')
      expect(page).to have_css("img[src*='https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg']")
    end
  end

  context 'user likes a recipe' do
    it 'adds a like to a user', :vcr do
      visit '/recipes/52772'
      # # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      click_link('Login')
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
      visit '/recipes/52772'
      click_button 'Like'

      expect(page).to have_content('You have liked this recipe!')
    end
  end

  context 'user dislikes a recipe' do
    it 'adds a dislike to a user', :vcr do
      visit '/recipes/52772'
      click_link('Login')
      visit '/recipes/52772'
      click_button 'Dislike'

      expect(page).to have_content('Ew Gross!!')
    end
  end

end
