require 'spec_helper'
require 'rails_helper'

describe "Cookbook" do
  it "loads root and renders home view" do
    get root_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:home)
  end

  it "loads home and renders view" do
    get home_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:home)
  end

  it "loads advanced_search and renders view" do
    get advanced_search_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:advanced_search)
  end

  it "loads add_recipe and renders view" do
    get add_recipe_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:add_recipe)
  end

  it "loads saved_recipes and renders view" do
    get saved_recipes_url
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:saved_recipes)
  end
end
