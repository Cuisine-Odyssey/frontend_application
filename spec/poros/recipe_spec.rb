require 'rails_helper'

RSpec.describe "Recipe object" do
  it 'exists' do
    meals = {
      "meals": [
          {
              "idMeal": "52896",
              "strMeal": "Full English Breakfast",
              "strCategory": "Breakfast",
              "strArea": "British",
              "strInstructions": "Heat the flat grill plate over a low heat, on top of 2 rings/flames if it fits, and brush sparingly with light olive oil.\r\nCook the sausages first. Add the sausages to the hot grill plate/the coolest part if there is one and allow to cook slowly for about 15-20 minutes, turning occasionally, until golden. After the first 10 minutes, increase the heat to medium before beginning to cook the other ingredients. If you are struggling for space, completely cook the sausages and keep hot on a plate in the oven.\r\nSnip a few small cuts into the fatty edge of the bacon. Place the bacon straight on to the grill plate and fry for 2-4 minutes each side or until your preferred crispiness is reached. Like the sausages, the cooked bacon can be kept hot on a plate in the oven.\r\nFor the mushrooms, brush away any dirt using a pastry brush and trim the stalk level with the mushroom top. Season with salt and pepper and drizzle over a little olive oil. Place stalk-side up on the grill plate and cook for 1-2 minutes before turning and cooking for a further 3-4 minutes. Avoid moving the mushrooms too much while cooking, as this releases the natural juices, making them soggy.\r\nFor the tomatoes, cut the tomatoes across the centre/or in half lengthways if using plum tomatoes , and with a small, sharp knife remove the green 'eye'. Season with salt and pepper and drizzle with a little olive oil. Place cut-side down on the grill plate and cook without moving for 2 minutes. Gently turn over and season again. Cook for a further 2-3 minutes until tender but still holding their shape.\r\nFor the black pudding, cut the black pudding into 3-4 slices and remove the skin. Place on the grill plate and cook for 1½-2 minutes each side until slightly crispy.\r\nFor 'proper' fried bread it's best to cook it in a separate pan. Ideally, use bread that is a couple of days old. Heat a frying pan to a medium heat and cover the base with oil. Add the bread and cook for 2-3 minutes each side until crispy and golden. If the pan becomes too dry, add a little more oil. For a richer flavour, add a knob of butter after you turn the slice.\r\nFor the fried eggs, break the egg straight into the pan with the fried bread and leave for 30 seconds. Add a good knob of butter and lightly splash/baste the egg with the butter when melted. Cook to your preferred stage, season and gently remove with a fish slice.\r\nOnce all the ingredients are cooked, serve on warm plates and enjoy straight away with a good squeeze of tomato ketchup or brown sauce.",
              "strMealThumb": "https://www.themealdb.com/images/media/meals/sqrtwu1511721265.jpg",
              "strTags": "Greasy,UnHealthy,HangoverFood,Calorific,Breakfast,BBQ",
              "strYoutube": "https://www.youtube.com/watch?v=FXjYU2Ensck",
              "strIngredient1": "Sausages",
              "strIngredient2": "Bacon",
              "strIngredient3": "Mushrooms",
              "strIngredient4": "Tomatoes",
              "strIngredient5": "Black Pudding",
              "strIngredient6": "Eggs",
              "strIngredient7": "Bread",
              "strIngredient8": "Baked Beans",
              "strIngredient9": "",
              "strIngredient10": "",
              "strIngredient11": "",
              "strIngredient12": "",
              "strIngredient13": "",
              "strIngredient14": "",
              "strIngredient15": "",
              "strIngredient16": "",
              "strIngredient17": "",
              "strIngredient18": "",
              "strIngredient19": "",
              "strIngredient20": "",
              "strMeasure1": "4",
              "strMeasure2": "4",
              "strMeasure3": "4",
              "strMeasure4": "3",
              "strMeasure5": "2 sliced",
              "strMeasure6": "2",
              "strMeasure7": "1 Slice",
              "strMeasure8": "100g ",
              "strMeasure9": "",
              "strMeasure10": "",
              "strMeasure11": "",
              "strMeasure12": "",
              "strMeasure13": "",
              "strMeasure14": "",
              "strMeasure15": "",
              "strMeasure16": "",
              "strMeasure17": "",
              "strMeasure18": "",
              "strMeasure19": "",
              "strMeasure20": "",
              "strSource": "https://www.bbc.co.uk/food/recipes/stressfreefullenglis_67721"
          }
      ]
  }

    recipe = Recipe.new(meals)

    expect(recipe).to be_a Recipe
    expect(recipe.recipe_id).to eq('52896')
    expect(recipe.title).to eq('Full English Breakfast')
    expect(recipe.location).to eq('British')
    expect(recipe.instructions).to start_with('Heat the flat grill')
    expect(recipe.ingredients).to be_an Array
    expect(recipe.ingredients.length).to eq(8)
    expect(recipe.amounts).to be_an Array
    expect(recipe.amounts.length).to eq(8)
    expect(recipe.combined['Bacon']).to eq('4')
    expect(recipe.combined['Eggs']).to eq('2')
  end
end
