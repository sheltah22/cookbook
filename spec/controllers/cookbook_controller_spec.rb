require 'spec_helper'
require 'rails_helper'

describe CookbookController do
  describe "get home" do
    it "assigns random recipe vars" do
      get :home
      expect(assigns(:keywords)).to be
      expect(assigns(:title)).to be
      expect(assigns(:category)).to be
      expect(assigns(:ingredients).size).to be >=5
    end
  end
end
