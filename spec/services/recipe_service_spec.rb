
require 'rails_helper'

RSpec.describe 'Recipe Service' do
  it 'returns a faraday response', :vcr do
    VCR.use_cassette('returns_a_faraday_response') do
      connection = RecipeService.external_connection
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

  it 'returns a list of up to 5 recipes from a given region', :vcr do
    VCR.use_cassette('returns_a_list_of_up_to_5_recipes_from_random_regions') do
      recipe_list = RecipeService.get_five_recipes("Canadian")
      expect(recipe_list).to be_a Array
      expect(recipe_list.count).to eq(5)
    end
  end

  it 'gets a single recipe details', :vcr do
    VCR.use_cassette('returns_a_single_recipe_details') do
      recipe = RecipeService.get_single_recipe_details('52896')
      expect(recipe).to be_a Hash
      expect(recipe[:meals][0]).to have_key(:idMeal)
      expect(recipe[:meals][0]).to have_key(:strMeal)
      expect(recipe[:meals][0]).to have_key(:strArea)
      expect(recipe[:meals][0]).to have_key(:strInstructions)
      expect(recipe[:meals][0]).to have_key(:strMealThumb)
      expect(recipe[:meals][0]).to have_key(:strIngredient1)
      expect(recipe[:meals][0]).to have_key(:strMeasure1)
    end
  end

  it 'returns a faraday response', :vcr do
    intl_connection = RecipeService.internal_connection
    expect(intl_connection).to be_a(Faraday::Connection)
  end

  xit 'sends a vote', :vcr do
    VCR.use_cassette('gets_successful_response') do
      custom_params = {
        'recipe_api_id': 52896,
        'email': params[:email],
        'vote': 'like'
      }
      vote = RecipeService.send_recipe_vote(custom_params)
    end
  end
end
