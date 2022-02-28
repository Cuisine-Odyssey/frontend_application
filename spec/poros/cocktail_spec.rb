require 'rails_helper'

RSpec.describe "Cocktail object" do
  it "exists" do
    drinks =

            {
                "idDrink": "12418",
                "strDrink": "Turf Cocktail",
                "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/utypqq1441554367.jpg",
                "strInstructions": "Stir all ingredients (except orange peel) with ice and strain into a cocktail glass. Add the twist of orange peel and serve.",
                "strIngredient1": "Dry Vermouth",
                "strIngredient2": "Gin",
                "strIngredient3": "Anis",
                "strIngredient4": "Bitters",
                "strIngredient5": "Orange peel",
                "strIngredient6": nil,
                "strIngredient7": nil,
                "strMeasure1": "1 oz ",
                "strMeasure2": "1 oz ",
                "strMeasure3": "1/4 tsp ",
                "strMeasure4": "2 dashes ",
                "strMeasure5": "Twist of ",
                "strMeasure6": nil,
                "strMeasure7": nil

            }

      expected_1 = ["Dry Vermouth","Gin","Anis","Bitters","Orange peel"]
      expected_2 = ["1 oz ","1 oz ","1/4 tsp ","2 dashes ","Twist of "]
      expected_3 = {"Anis"=>"1/4 tsp ", "Bitters"=>"2 dashes ", "Dry Vermouth"=>"1 oz ", "Gin"=>"1 oz ", "Orange peel"=>"Twist of "}
      cocktail = Cocktail.new(drinks)

      expect(cocktail).to be_a Cocktail
      expect(cocktail.api_id).to eq("12418")
      expect(cocktail.name).to eq("Turf Cocktail")
      expect(cocktail.image).to eq("https://www.thecocktaildb.com/images/media/drink/utypqq1441554367.jpg")
      expect(cocktail.instructions).to eq("Stir all ingredients (except orange peel) with ice and strain into a cocktail glass. Add the twist of orange peel and serve.")
      expect(cocktail.ingredients).to eq(expected_1)
      expect(cocktail.drink_ingredients(drinks)).to eq(expected_1)

      expect(cocktail.measurements).to eq(expected_2)
      expect(cocktail.drink_measurements(drinks)).to eq(expected_2)

      expect(cocktail.cocktail_hash).to eq(expected_3)
      expect(cocktail.create_cocktail_hash).to eq(expected_3)

  end
end
