require 'rails_helper'

RSpec.describe "Recipe object" do
  it 'exists' do
    meals = {
    "meals": [
        {
            "idMeal": "52896",
            "strMeal": "Full English Breakfast",
            "strArea": "British",
            "strInstructions": "Heat the flat grill"
        }
    ]
}

    recipe = Recipe.new(meals)

    expect(recipe).to be_a Recipe
    expect(recipe.recipe_id).to eq('52896')
    expect(recipe.title).to eq('Full English Breakfast')
    expect(recipe.location).to eq('British')
    expect(recipe.instructions).to eq('Heat the flat grill')
  end
end
