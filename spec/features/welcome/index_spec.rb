require 'rails_helper'

RSpec.describe 'the website home page' do

  before :each do
    visit root_path
  end

  it 'exists' do
    expect(current_path).to eq(root_path)
  end

  it 'has basic app content' do
    # expect(page).to have_content('Cuisine Odyssey')
    # within("#slogan") do
    #   expect(page).to have_content('Connecting users to diverse foods and culture')
    # end

    within("#instructions") do
      expect(page).to have_content('Spin the globe for unique regional recipes, or the bottle for random cocktails')
    end

    #below is a placeholder image
    # expect(page).to have_css('img[src="https://image.tmdb.org/t/p/w92//6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg"]')
  end

  it 'has a button to roll the globe' do
    within('#spin-the-globe') do
      expect(page).to have_css('img[src="https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"]')
      expect(page).to have_button('Spin for recipes!')
    end
  end

end
