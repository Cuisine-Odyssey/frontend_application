require 'rails_helper'
RSpec.describe 'Cocktails show page' do
  it 'can view cocktail details' do
    visit '/cocktails'

    expect(page).to have_css("#cocktail-name")
    expect(page).to have_css("#cocktail-instructions")
    expect(page).to have_css("#cocktail-ingredients")
    expect(page).to have_css("img")
  end

  it 'has like and dislike buttons', :vcr do
    # visit '/cocktails'
    visit root_path
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
    click_link('Login')
    click_button 'Spin for drinks!'
    click_link 'Like'
    save_and_open_page
    expect(page).to have_css("#liked")
  end

  # context 'user likes a recipe' do
  #   it 'adds a like to a user', :vcr do
  #     visit '/recipes/52772'
  #     click_link('Login')
  #     visit '/recipes/52772'
  #     click_button 'Like'
  #
  #     expect(page).to have_content('You have liked this recipe!')
  #   end
  end
