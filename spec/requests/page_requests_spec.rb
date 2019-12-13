require 'spec_helper'
require 'rails_helper'

describe "Cookbook" do
  let(:base_title) { "Cookbook" }

  before(:each) do
    user = User.create(name: "Test User", email: "user@example.com",
                       password: "longpassword", password_confirmation: "longpassword")
    log_in_as(user)
  end

  it "loads root and renders home view with correct title" do
    get root_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:home)
    assert_select "title", base_title
  end

  it "loads home and renders view with correct title" do
    get home_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:home)
    assert_select "title", base_title
  end

  it "loads advanced_search and renders view with correct title" do
    get search_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:search)
    assert_select "title", "Search | #{base_title}"
  end

  it "loads add_recipe and renders view with correct title" do
    get add_recipe_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template('recipes/new')
    assert_select "title", "Add Recipe | #{base_title}"
  end

  it "loads saved_recipes and renders view with correct title" do
    get saved_recipes_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:saved_recipes)
    assert_select "title", "Saved Recipes | #{base_title}"
  end

  it "loads browse and renders view with correct title" do
    get browse_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:browse)
    assert_select "title", "Browse | #{base_title}"
  end
end
