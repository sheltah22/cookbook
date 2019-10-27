require 'rails_helper'

describe "Sessions" do

  it "should get new" do
    get login_path
    expect(response).to have_http_status(:success)
  end

  it "should not login with invalid information" do
    get login_path
    expect(response).to render_template('sessions/new')
    post login_path, params: { session: { email: "", password: "" }}
    expect(response).to render_template('sessions/new')
    expect(flash[:danger]).to be
    get root_path
    expect(flash[:danger]).to_not be
  end
end
