# app/spec/facades/user_facade_spec.rb

require 'rails_helper'

RSpec.describe 'User Facade' do
  scenario 'user exists and is returned by the backend' do
    VCR.use_cassette('.find_or_create_user(auth_hash)') do
      auth_hash = { 'info' =>
                    {
                      'email' => 'TheOtherOne@gmail.com',
                      'first_name' => 'Bob',
                      'last_name' => 'Weir'
                    }
                  }

      user = UserFacade.find_or_create_user(auth_hash)
      expect(user).to be_a User
    end

    # VCR.use_cassette('.get_user(id)') do
    #   user = UserFacade.get_user_by_id('10')
    #   expect(user).to be_a Hash
    # end
  end

  scenario 'user does not yet exist in the database; oauth2 provides data to create new User' do
    VCR.use_cassette('new_find_or_create_user(auth_hash)') do
      auth_hash = { 'info' =>
                    {
                      'email' => 'OneMore@gmail.com',
                      'first_name' => 'Babs',
                      'last_name' => 'Weir'
                    }
                  }

      user = UserFacade.find_or_create_user(auth_hash)
      expect(user).to be_a User
    end
  end

  it 'returns a users recipes', :vcr do
    params = {
        'email': 'chuck@gmail.com',
        'first_name': 'Chuck',
        'last_name': 'Norris'
      }
    
    chops = 
      { "meals" =>
              [
                { "idMeal": "52994",
              "strMeal": "Skillet Apple Pork Chops with Roasted Sweet Potatoes & Zucchini",
              "strInstructions": "\r\nServes 2\r\n\r\n\r\n1. \r\n\r\nAdjust racks to top and middle positions and preheat oven to 450 degrees. Wash and dry all produce. Dice sweet potatoes into 1/2-inch pieces.",
              "strMealThumb": "https://www.themealdb.com/images/media/meals/h3ijwo1581013377.jpg",
              "strIngredient1": "Potatoes",
              "strIngredient2": "Apples",
              "strIngredient3": "Garlic",
              "strIngredient4": "Lemon",
              "strIngredient5": "Pork",
              "strIngredient6": "Zucchini",
              "strIngredient7": "Chicken Stock",
              "strIngredient8": "Vegetable Oil",
              "strIngredient9": "Sugar",
              "strIngredient10": "Butter",
              "strMeasure1": "2",
              "strMeasure2": "1",
              "strMeasure3": "2 cloves",
              "strMeasure4": "1",
              "strMeasure5": "2",
              "strMeasure6": "1",
              "strMeasure7": "1",
              "strMeasure8": "1 tbsp",
              "strMeasure9": "1 1/2 tsp ",
              "strMeasure10": "2 tbsp"
            }
          ]
        }
    true_json = JSON.generate(chops) 
    json = JSON.parse(true_json, symbolize_names: true)
    chops_recipe = Recipe.new(json)
    allow(UserFacade).to receive(:get_user_recipes).and_return([chops_recipe])

    RecipeFacade.add_recipe_vote({
      'recipe_api_id': '52994',
      'email': 'chuck@gmail.com',
      'vote': 'like'
    })
    
    user_recipes = UserFacade.get_user_recipes(params)
    expect(user_recipes).to be_an Array

    user_recipes.each do |recipe|
      expect(recipe).to be_a Recipe
    end
  end
end
