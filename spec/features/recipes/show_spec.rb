require 'rails_helper'

RSpec.describe 'Recipe show page', type: :feature do
  context 'receives a valid recipe id' do
    it 'can view recipe details' do
      VCR.use_cassette('show_one_recipes_details') do
        visit "/recipes/52772"
        
        expect(page).to have_content("Teriyaki Chicken Casserole")
        expect(page).to have_content("Japanese")
        # save_and_open_page
        expect(page).to have_css("img[src*='https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg']")
        expect(page).to have_link("Back to Recipes List")
      end
    end
  end

  context 'user likes a recipe' do
    it 'adds a like to a user' do
      VCR.use_cassette('like_a_recipe') do
        #mock the current user/session
        visit "/recipes/52772"
        
        click_button "Like"
      end
    end
  end

end
