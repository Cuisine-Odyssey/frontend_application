require 'rails_helper'

RSpec.describe 'Recipe Index Page' do
  describe 'view' do
    it 'shows recipes on the recipe page', :vcr do
      visit recipes_path

      within "#location" do
        expect(page).to have_content("British")
      end

      save_and_open_page
      # within "#test-1" do
      #   expect(page).to have_an(String)
      # end
    end

    it 'shows the proper logic for a logged in user', :user do


    end
  end
end
