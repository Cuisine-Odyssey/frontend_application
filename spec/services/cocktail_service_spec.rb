require 'rails_helper'
RSpec.describe 'Cocktail Service' do
  it 'returns a faraday response', :vcr do
      connection = CocktailService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns a cocktail at random', :vcr do

    random_cocktail = CocktailService.search_random_cocktail
    expect(random_cocktail).to be_a Hash
    expect(random_cocktail[:drinks]).to be_a Array
    expect(random_cocktail[:drinks][0]).to have_key :idDrink

    expect(random_cocktail[:drinks][0]).to have_key :strDrink

    expect(random_cocktail[:drinks][0]).to have_key :strInstructions

    expect(random_cocktail[:drinks][0]).to have_key :strIngredient1

    expect(random_cocktail[:drinks][0]).to have_key :strMeasure1

  end
end
