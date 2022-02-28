require 'rails_helper'

RSpec.describe 'Recipe Index Page' do
  describe 'view' do
    xit 'shows recipes on the recipe page', :vcr do
      visit recipes_path

      click_link('Recipe')
    end
  end
end
