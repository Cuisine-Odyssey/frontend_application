# app/spec/poros/user_spec.rb

require 'rails_helper'

RSpec.describe "User object" do
  it 'exists' do
    attributes = {
      first_name: 'Joe',
      last_name: 'Schmoe',
      email: 'jschmoe@mail.com',
      likes: [5, 1835]
    }

    user = User.new(attributes)

    expect(user).to be_a User
    expect(user.first_name).to eq('Joe')
    expect(user.last_name).to eq('Schmoe')
    expect(user.email).to eq('jschmoe@mail.com')
    expect(user.liked_recipes).to eq([5, 1835])
  end
end
