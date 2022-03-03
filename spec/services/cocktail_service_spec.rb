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

  it 'returns a faraday response', :vcr do
    intl_connection = CocktailService.internal_connection_cocktail
    expect(intl_connection).to be_a(Faraday::Connection)
  end

  it 'returns a specified cocktail', :vcr do
    specific_cocktail = CocktailService.get_cocktail_data(11007)

    expect(specific_cocktail).to be_a Hash
    expect(specific_cocktail[:drinks]).to be_a Array
    expect(specific_cocktail[:drinks][0]).to have_key :idDrink
    expect(specific_cocktail[:drinks][0]).to have_key :strDrink
    expect(specific_cocktail[:drinks][0]).to have_key :strInstructions
    expect(specific_cocktail[:drinks][0]).to have_key :strIngredient1
    expect(specific_cocktail[:drinks][0]).to have_key :strMeasure1
  end

  xit 'sends a cocktail vote', :vcr do
    VCR.use_cassette('gets_successful_response') do
      custom_params = {
        'recipe_api_id': 52896,
        'email': params[:email],
        'vote': 'like'
      }
      vote = CocktailService.send_cocktail_vote(custom_params)
    end
  end
 end
