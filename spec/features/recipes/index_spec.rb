require 'rails_helper'

RSpec.describe 'Recipe Index Page' do
  describe 'view' do
    it 'shows recipes on the recipe page', :vcr do
      visit recipes_path

      save_and_open_page
      click_link('Recipe')
    end
  end
end
