
require 'rails_helper'

RSpec.describe 'Recipe Service' do
  it 'returns a Faraday response' do
    expect(RecipeService.connection).to be_a(Faraday::Connection)
  end

  it 'returns a Recipe at random' do
    random_recipe = RecipeService.get_random_recipe
    expect(random_recipe).to be_a Hash
    expect(random_recipe[:meals]).to be_a Array
    expect(random_recipe[:meals][0]).to have_key :idMeal
  end
end
