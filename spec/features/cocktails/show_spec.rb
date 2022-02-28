require 'rails_helper'
RSpec.describe 'Cocktails show page' do
  xit 'spins for random cocktail and is taken to a random cocktail show page' do
    visit root_path
    click_button('Spin for drinks!')
  end
end
