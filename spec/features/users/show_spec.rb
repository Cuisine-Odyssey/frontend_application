require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  it "has a user's liked recipes", :vcr do
      visit root_path
      click_link 'Login'
      visit '/recipes/52896'
      click_button 'Like'
      visit '/dashboard'

      expect(page).to have_content('Full English Breakfast')
  end

  it "does not have a user's dislikes" do
      visit root_path
      click_link 'Login'
      visit '/recipes/52991'
      click_button 'Dislike'
      visit '/dashboard'

      expect(page).to_not have_content('Mince Pies')
  end

  it "does not have a user's dislikes", :vcr do
      visit root_path
      click_link 'Login'
      visit '/recipes/52896'
      click_button 'Dislike'
      visit '/dashboard'

      expect(page).to_not have_content('Full English Breakfast')
  end

  it "has a like after changing from dislike to like", :vcr do
      visit root_path
      click_link 'Login'
      visit '/recipes/52991'
      click_button 'Like'
      visit '/dashboard'

      expect(page).to have_content('Mince Pies')
  end

  context 'start with like, change to dislike' do
    it "has a user's liked cocktails" do
      vesuvio = Cocktail.new({
                "idDrink": "12444",
                "strDrink": "Vesuvio",
                "strInstructions": "Shake all ingredients with ice, strain into an old-fashioned glass over ice cubes, and serve.",
                "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/26cq601492976203.jpg",
                "strIngredient1": "Light rum",
                "strIngredient2": "Sweet Vermouth",
                "strIngredient3": "Lemon",
                "strIngredient4": "Powdered sugar",
                "strIngredient5": "Egg white",
                "strMeasure1": "1 oz ",
                "strMeasure2": "1/2 oz ",
                "strMeasure3": "Juice of 1/2 ",
                "strMeasure4": "1 tsp ",
                "strMeasure5": "1 "
            })
        allow(CocktailFacade).to receive(:get_random_cocktail).and_return(vesuvio)
        visit root_path
        click_link 'Login'
        visit '/cocktails'
        click_button 'Like'
        visit '/dashboard'

        expect(page).to have_content('Vesuvio')
    end

    it "does not show a user's disliked cocktails" do
      vesuvio = Cocktail.new({
        "idDrink": "12444",
        "strDrink": "Vesuvio",
        "strInstructions": "Shake all ingredients with ice, strain into an old-fashioned glass over ice cubes, and serve.",
        "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/26cq601492976203.jpg",
        "strIngredient1": "Light rum",
        "strIngredient2": "Sweet Vermouth",
        "strIngredient3": "Lemon",
        "strIngredient4": "Powdered sugar",
        "strIngredient5": "Egg white",
        "strMeasure1": "1 oz ",
        "strMeasure2": "1/2 oz ",
        "strMeasure3": "Juice of 1/2 ",
        "strMeasure4": "1 tsp ",
        "strMeasure5": "1 "
    })
      allow(CocktailFacade).to receive(:get_random_cocktail).and_return(vesuvio)
      visit root_path
      click_link 'Login'
      visit '/cocktails'
      click_button 'Dislike'
      visit '/dashboard'

      expect(page).to_not have_content('Vesuvio')
    end
  end

  context 'start with dislike, change to a like' do
    it "does not show a user's disliked cocktails" do
      mocha_berry = Cocktail.new({
                "idDrink": "14209",
                "strDrink": "Mocha-Berry",
                "strInstructions": "pour 6 oz. of coffee in a mug or Irish coffee cup. add coca mix and chambord, mix well and top off with whipped cream.",
                "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/vtwyyx1441246448.jpg",
                "strIngredient1": "Coffee",
                "strIngredient2": "Chambord raspberry liqueur",
                "strIngredient3": "Cocoa powder",
                "strMeasure1": "6 oz ",
                "strMeasure2": "2 oz ",
                "strMeasure3": "2 tblsp "
            })

      allow(CocktailFacade).to receive(:get_random_cocktail).and_return(mocha_berry)
      visit root_path
      click_link 'Login'
      visit '/cocktails'
      click_button 'Dislike'
      visit '/dashboard'

      expect(page).to_not have_content('Mocha-Berry')
    end

    it "shows a user's liked cocktails" do
      mocha_berry = Cocktail.new({
                "idDrink": "14209",
                "strDrink": "Mocha-Berry",
                "strInstructions": "pour 6 oz. of coffee in a mug or Irish coffee cup. add coca mix and chambord, mix well and top off with whipped cream.",
                "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/vtwyyx1441246448.jpg",
                "strIngredient1": "Coffee",
                "strIngredient2": "Chambord raspberry liqueur",
                "strIngredient3": "Cocoa powder",
                "strMeasure1": "6 oz ",
                "strMeasure2": "2 oz ",
                "strMeasure3": "2 tblsp "
            })

      allow(CocktailFacade).to receive(:get_random_cocktail).and_return(mocha_berry)
      visit root_path
      click_link 'Login'
      visit '/cocktails'
      click_button 'Like'
      visit '/dashboard'

      expect(page).to have_content('Mocha-Berry')
    end
  end
end
