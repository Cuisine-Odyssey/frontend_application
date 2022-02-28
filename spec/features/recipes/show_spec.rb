require 'rails_helper'

RSpec.describe 'Recipe show page', type: :feature do
  context 'receives a valid recipe id' do
    it 'can view recipe details' do
      VCR.use_cassette('show_one_recipes_details') do
        visit "/recipes/52772"
        
        expect(page).to have_content("Teriyaki Chicken Casserole")
        expect(page).to have_content("Japanese")
        
      end
    end
  end


end
