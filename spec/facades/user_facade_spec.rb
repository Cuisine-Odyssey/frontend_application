# app/spec/facades/user_facade_spec.rb

require 'rails_helper'

RSpec.describe "User Facade" do
  it ".get_user(id) returns a user's details" do
    user = UserFacade.get_user_by_id('10')
    expect(user).to be_a User
  end
end
