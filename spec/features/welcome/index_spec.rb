require 'rails_helper'

RSpec.describe 'the website home page' do

  before :each do
    visit root_path
  end

  it 'exists' do
    expect(current_path).to eq(root_path)
  end

  it 'has a link to login page' do
    expect(page).to have_link("Login")
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    expect(current_path).to eq('/')
  end

  describe 'the welcome page features', :vcr do
    it 'has nav bar content' do
        expect(page).to have_link('Cuisine Odyssey')
        expect(page).to have_content('Connecting users to diverse foods and culture.')
        expect(page).to have_link('Login')
      end


    it 'has basic instructions', :vcr do
      within("#instructions") do
        expect(page).to have_content('Spin the globe for random regional recipes, or the bottle for random cocktails')
      end
    end

    it 'has a button to roll the globe', :vcr do
      within('#spin-the-globe') do
        expect(page).to have_css('img[src="https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"]')
      end

      within('#globe-button') do
        expect(page).to have_button('Spin for recipes!')
      end
    end

    it 'has a button to roll for drinks', :vcr do
      within('#spin-the-bottle') do
        expect(page).to have_css('img[src="https://media.giphy.com/media/qSvUQQSXqDHRBcOpyt/giphy.gif"]')
      end
    end
  end
end
