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

    xit 'shows the proper logic for a visitor', :vcr do
      visit recipes_path

      within "#visitor" do
        click_link
        expect(current_path).to_not eq(recipes_path)
      end
    end

    xit 'shows the proper logic for a logged in user', :vcr do
      visit recipes_path

      within "#user" do
        click_link('Seafood fideuà')
        expect(current_path).to eq(recipes_path('52836'))
      end
    end

    it "logs in a user from the recipe index page", :vcr do
      visit recipes_path

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
      click_link('Login')
      expect(current_path).to eq(root_path)
      click_button('Spin for recipes!')
      expect(current_path).to eq(recipes_path)
      expect(page).to have_link('Spanish Tortilla')
      expect(page).to have_link('Seafood fideuà')
      expect(page).to have_link('Roast fennel and aubergine paella')
    end
  end
end
