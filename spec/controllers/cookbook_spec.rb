require 'spec_helper'
require 'rails_helper'

describe CookbookController do
  describe 'get home' do
    it 'returns a 200 OK status' do
      get :home
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get add_recipe' do
    it 'returns a 200 OK status' do
      get :add_recipe
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get advanced_search' do
    it 'returns a 200 OK status' do
      get :advanced_search
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get saved_recipes' do
    it 'returns a 200 OK status' do
      get :saved_recipes
      expect(response).to have_http_status(:ok)
    end
  end

end
