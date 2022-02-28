require 'rails_helper'

RSpec.describe CocktailFacade, type: :facade do
  context 'class methods' do
    describe '::get_random_cocktail' do
      it 'should return a recipe object', :vcr do
        cocktail = CocktailFacade.get_random_cocktail

        expect(cocktail).to be_a(Cocktail)
      end
    end
  end
end
