require 'rails_helper'

RSpec.describe "Recipe object" do
  it 'exists' do
    meals = {
      idMeal: '123',
      strMeal: 'fish',
      strArea: 'France',
      strInstructions: 'make fish'
    }

    recipe = Recipe.new(meals)

    expect(recipe).to be_a Recipe
    expect(recipe.recipe_id).to eq('123')
    expect(recipe.title).to eq('fish')
    expect(recipe.location).to eq('France')
    expect(recipe.instructions).to eq('make fish')
  end
end
