require 'rails_helper'
RSpec.describe 'Cocktails show page' do
  it 'can view cocktail details' do
    visit '/cocktails'

    save_and_open_page
    expect(page).to have_css("img")
  end
end
