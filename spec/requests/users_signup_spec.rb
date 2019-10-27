require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

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

  it "adds user with valid input and logs out" do
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
    expect(is_logged_in?).to be
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", signup_path, count: 0
    assert_select "a[href=?]", logout_path

    get logout_path
    expect(is_logged_in?).to_not be
    expect(response).to redirect_to(root_url)
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", logout_path,      count: 0
  end
end
