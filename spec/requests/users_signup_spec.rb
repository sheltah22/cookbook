require 'rails_helper'

describe "User Signup" do

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

  it "adds user with valid input" do
    get signup_path
    expect do
      post users_path, params: { user: { name: "Example User",
                                         email: "username@exammple.com",
                                         password: "password",
                                         password_confirmation: "password" }}
    end.to change(User, :count).by(1)
    expect(response).to redirect_to(assigns(:user))
    follow_redirect!
    expect(response).to render_template('users/show')
  end
end
