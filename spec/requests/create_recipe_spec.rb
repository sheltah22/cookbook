require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe "Create Recipe" do

  it "does not add user with invalid input" do
    get signup_path
    expect do
      post users_path, params: { user: { name: "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar" }}
    end.not_to change { User.count }
    expect(response).to render_template('users/new')
  end
end
