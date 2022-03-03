require 'rails_helper'

RSpec.describe 'Recipe Index Page' do
  describe 'view' do
    context 'use the same cassette', :vcr do
      it 'shows recipes on the recipe page' do
        recipe_1_data = {
          "meals": [
              {
                  "idMeal": "52997",
                  "strMeal": "Beef Banh Mi Bowls with Sriracha Mayo, Carrot & Pickled Cucumber",
                  "strArea": "Vietnamese",
                  "strInstructions": "Add'l ingredients: mayonnaise, siracha\r\n\r\n1\r\n\r\nPlace rice in a fine-mesh sieve and rinse until water runs clear. Add to a small pot with 1 cup water (2 cups for 4 servings) and a pinch of salt. Bring to a boil, then cover and reduce heat to low. Cook until rice is tender, 15 minutes.",
                  "strMealThumb": "https://www.themealdb.com/images/media/meals/z0ageb1583189517.jpg",
                  "strIngredient1": "Rice",
                  "strIngredient2": "Onion",
                  "strIngredient3": "Lime",
                  "strIngredient4": "Garlic Clove",
                  "strIngredient5": "Cucumber",
                  "strIngredient6": "Carrots",
                  "strIngredient7": "Ground Beef",
                  "strIngredient8": "Soy Sauce",
                  "strMeasure1": "White",
                  "strMeasure2": "1",
                  "strMeasure3": "1",
                  "strMeasure4": "3",
                  "strMeasure5": "1",
                  "strMeasure6": "3 oz ",
                  "strMeasure7": "1 lb",
                  "strMeasure8": "2 oz "
              }
          ]
      }

      recipe_2_data = {
        "meals": [
            {
                "idMeal": "52828",
                "strMeal": "Vietnamese Grilled Pork (bun-thit-nuong)",
                "strArea": "Vietnamese",
                "strInstructions": "Slice the uncooked pork thinly, about ⅛\". It helps to slightly freeze it (optional).\r\nMince garlic and shallots. Mix in a bowl with sugar, fish sauce, thick soy sauce, pepper, and oil until sugar dissolves.\r\nMarinate the meat for 1 hour, or overnight for better results.",
                "strMealThumb": "https://www.themealdb.com/images/media/meals/qqwypw1504642429.jpg",
                "strIngredient1": "Pork",
                "strIngredient2": "Rice Vermicelli",
                "strIngredient3": "Egg Rolls",
                "strIngredient4": "Challots",
                "strIngredient5": "Garlic",
                "strIngredient6": "Sugar",
                "strIngredient7": "Fish Sauce",
                "strIngredient8": "Soy sauce",
                "strIngredient9": "Pepper",
                "strIngredient10": "Olive Oil",
                "strIngredient11": "Cucumber",
                "strIngredient12": "Mint",
                "strIngredient13": "Peanuts",
                "strMeasure1": "1.5 pounds sliced",
                "strMeasure2": "1 package thin",
                "strMeasure3": "4-6",
                "strMeasure4": "3 tablespoons minced",
                "strMeasure5": "1.5 tablespoons minced garlic",
                "strMeasure6": "¼ cup",
                "strMeasure7": "1 tablespoon",
                "strMeasure8": "½ tablespoon thick",
                "strMeasure9": "½ tablespoon",
                "strMeasure10": "3 tablespoons",
                "strMeasure11": "Sliced",
                "strMeasure12": "Leaves",
                "strMeasure13": "Crushed",
                "strSource": "http://www.hungryhuy.com/bun-thit-nuong-recipe-vietnamese-grilled-bbq-pork-with-rice-vermicelli-vegetables/"
            }
        ]
    }
        true_json_1 = JSON.generate(recipe_1_data)
        true_json_2 = JSON.generate(recipe_2_data)
        parsed_1 = JSON.parse(true_json_1, symbolize_names: true)
        parsed_2 = JSON.parse(true_json_2, symbolize_names: true)

        @recipe1 = Recipe.new(parsed_1)
        @recipe2 = Recipe.new(parsed_2)

        allow(RecipeFacade).to receive(:get_random_recipe).and_return(@recipe1)
        allow(RecipeFacade).to receive(:get_five_recipes).and_return([@recipe1, @recipe2])

        visit recipes_path

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
        click_link('Login')
        expect(current_path).to eq(root_path)
        click_button('Spin for recipes!')
        expect(current_path).to eq(recipes_path)

        within "#location" do
          expect(page).to have_content('Vietnamese Recipes')
        end
        
        within "#user" do
          expect(page).to have_content('Vietnamese Grilled Pork')
          click_link('Vietnamese Grilled Pork (bun-thit-nuong)')
          expect(current_path).to eq(recipe_path(@recipe2.recipe_id))
        end
      end
    end
  end
end
