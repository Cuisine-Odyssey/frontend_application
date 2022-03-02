require 'rails_helper'
RSpec.describe 'Cocktails show page' do
  it 'can view cocktail details' do
    visit '/cocktails'

    expect(page).to have_css("#cocktail-name")
    expect(page).to have_css("#cocktail-instructions")
    expect(page).to have_css("#cocktail-ingredients")
    expect(page).to have_css("img")
  end
end
