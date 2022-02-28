require 'rails_helper'

RSpec.describe 'Recipe Index Page' do
  describe 'view' do
    it 'shows recipes on the recipe page', :vcr do
      visit recipes_path

      within "#location" do
        expect(page).to have_content('Spanish Recipes')
      end

      expect(page).to have_content('Spanish Tortilla')
      expect(page).to have_content('Roast fennel and aubergine paella')
      expect(page).to have_content('Seafood fideuà')
    end

    it 'shows the proper logic for a visitor', :vcr do
      visit recipes_path

      within "#visitor" do
        click_link
        expect(current_path).to_not eq(recipes_path)
      end
    end

    xit 'shows the proper logic for a logged in user', :vcr do
      visit recipes_path

      #log in user with OAuth

      within "#user" do
        click_link('Seafood fideuà')
        expect(current_path).to eq(recipes_path('52836'))
      end
    end

  end
end
