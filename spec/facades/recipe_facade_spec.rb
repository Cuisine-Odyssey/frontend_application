require 'rails_helper'

RSpec.describe RecipeFacade, type: :facade do
  context 'class methods' do
    describe '::get_random_recipe' do
      it 'should return a recipe object' do
        recipe = RecipeFacade.get_random_recipe

        expect(recipe).to be_a(Recipe)
      end
    end
  end
end
