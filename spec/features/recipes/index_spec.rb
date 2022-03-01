require 'rails_helper'

RSpec.describe 'Recipe Index Page' do
  describe 'view' do
    it 'shows recipes on the recipe page', :vcr do
      visit recipes_path

      within "#location" do
        expect(page).to have_content('Spanish Recipes')
      end

      expect(page).to have_content('Spanish Tortilla')
      expect(page).to have_content('Roast fennel and aubergine paella')
      expect(page).to have_content('Seafood fideuà')
    end

    it 'shows the proper logic for a visitor', :vcr do
      visit recipes_path

      within "#visitor" do
        click_link
        expect(current_path).to_not eq(recipes_path)
      end
    end

    xit 'shows the proper logic for a logged in user', :vcr do
      visit recipes_path

      within "#user" do
        click_link('Seafood fideuà')
        expect(current_path).to eq(recipes_path('52836'))
      end
    end

    it "logs in a user from the recipe index page" do
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                     provider: 'google_oauth2',
                                                                     uid: '123456789',
                                                                     info: {
                                                                       name: 'wade wade',
                                                                       email: 'wade.wade@gmail.com',
                                                                       first_name: 'wade',
                                                                       last_name: 'wade',
                                                                       image: 'https://lh3.googleusercontent.com/url/photo.jpg'
                                                                     },
                                                                     credentials: {
                                                                       token: 'token',
                                                                       refresh_token: 'another_token',
                                                                       expires_at: 1_354_920_555,
                                                                       expires: true
                                                                     }
                                                                   })
      visit recipes_path
      click_link('Login')
      expect(current_path).to eq(root_path)
      click_button('Spin for recipes!')
      expect(current_path).to eq(recipes_path)
      # expect(page).to have_link("Irish stew")
        # expect(current_path).to eq(recipes_path("52797"))

        # {"idMeal":"52797","strMeal":"Spicy North African Potato Salad"
      # end
    end

  end
end
