require 'rails_helper'

RSpec.describe 'the website home page' do

  before :each do
    visit root_path
  end

  it 'exists' do
    expect(current_path).to eq(root_path)
  end

  xit 'has a link to login page' do
    click_link 'Login'

    expect(current_path).to eq('/auth/google_oauth2')
  end

  describe 'the welcome page features' do
    it 'has nav bar content' do
      within('#navbar') do
        expect(page).to have_link('Cuisine Odyssey')
        expect(page).to have_content('Connecting users to diverse foods and culture.')
        expect(page).to have_link('Login')
      end
    end

    it 'has basic instructions' do
      within("#instructions") do
        expect(page).to have_content('Spin the globe for random regional recipes, or the bottle for random cocktails')
      end
    end

    it 'has a button to roll the globe' do
      within('#spin-the-globe') do
        expect(page).to have_css('img[src="https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"]')
      end

      within('#globe-button-1') do
        expect(page).to have_button('Spin for one region!')
      end

      within('#globe-button-2') do
        expect(page).to have_button('Spin for all regions!')
      end
    end

    it 'has a button to roll for drinks' do
      within('#spin-the-bottle') do
        expect(page).to have_css('img[src="https://ia802306.us.archive.org/9/items/rotatingfood6/0_eSc9N3QdQiINZDQR.gif"]')
        expect(page).to have_button('Spin for drinks!')
      end
    end
  end
end
