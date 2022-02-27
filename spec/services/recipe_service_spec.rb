
require 'rails_helper'

RSpec.describe 'Recipe Service' do
  it 'returns a faraday response', :vcr do
    VCR.use_cassette('returns_a_faraday_response') do
      connection = RecipeService.connection
      expect(connection).to be_a(Faraday::Connection)
    end
  end

  it 'returns a recipe at random', :vcr do
    VCR.use_cassette('returns_a_recipe_at_random') do
      random_recipe = RecipeService.get_random_recipe
      expect(random_recipe).to be_a Hash
      expect(random_recipe[:meals]).to be_a Array
      expect(random_recipe[:meals][0]).to have_key :idMeal
    end
  end

  it 'returns a list of up to 5 recipes from random regions', :vcr do
    VCR.use_cassette('returns_a_list_of_up_to_5_recipes_from_random_regions') do
      recipe_list = RecipeService.get_five_recipes
      expect(recipe_list).to be_a Array
      expect(recipe_list.count).to eq(5)
    end 
  end
end
