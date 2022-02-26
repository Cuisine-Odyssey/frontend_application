require 'rails_helper'

RSpec.describe RecipeFacade, type: :facade do
  context 'class methods' do
    describe '::get_random_recipe' do
      it 'should return a recipe object' do
        recipe = RecipeFacade.get_random_recipe

        expect(recipe).to be_a(Recipe)
      end
    end

    describe '::get_five_recipes' do
      it 'should return an array of recipe objects' do
        recipes = RecipeFacade.get_five_recipes

        expect(recipes.first).to be_a(Recipe)
        expect(recipes.count).to eq(5)
      end
    end
  end
end
