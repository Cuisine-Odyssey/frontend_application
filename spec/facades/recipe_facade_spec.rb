require 'rails_helper'

RSpec.describe RecipeFacade, type: :facade do
  context 'class methods' do
    describe '::get_random_recipe' do
      it 'should return a recipe object' do
        VCR.use_cassette('should__return_a_recipe_object') do
          recipe = RecipeFacade.get_random_recipe

          expect(recipe).to be_a(Recipe)
        end
      end
    end

    describe '::get_five_recipes' do
      it 'should return an array of recipe objects' do
        VCR.use_cassette('returns_a_array') do
          recipes = RecipeFacade.get_five_recipes("Canadian")

          expect(recipes.first).to be_a(Recipe)
          expect(recipes.count).to eq(5)
        end
      end
    end
  end
end
