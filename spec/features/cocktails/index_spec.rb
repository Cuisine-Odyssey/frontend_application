#spec/features/cocktail/index_spec.rb
require 'rails_helper'
RSpec.describe 'Cocktails show page' do
  before(:each) do
    cocktail_data = 
          {
              "idDrink": "11007",
              "strDrink": "Margarita",
              "strInstructions": "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.",
              "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
              "strIngredient1": "Tequila",
              "strIngredient2": "Triple sec",
              "strIngredient3": "Lime juice",
              "strIngredient4": "Salt",
              "strMeasure1": "1 1/2 oz ",
              "strMeasure2": "1/2 oz ",
              "strMeasure3": "1 oz "
          }
      json = JSON.generate(cocktail_data)
      json_parsed = JSON.parse(json, symbolize_names:true)
      @cocktail = Cocktail.new(json_parsed)  
  end

  it 'can view cocktail details' do
    visit '/cocktails'

    expect(page).to have_css("#cocktail-name")
    expect(page).to have_css("#cocktail-instructions")
    expect(page).to have_css("#cocktail-ingredients")
    expect(page).to have_css("img")
  end

  it 'has like and dislike buttons' do
    allow(CocktailFacade).to receive(:get_random_cocktail).and_return(@cocktail)
    visit root_path
    click_link('Login')
    click_button 'Spin for drinks!'
    click_button 'Like'
    
    expect(current_path).to eq(cocktail_path(@cocktail.api_id))
  end

end
