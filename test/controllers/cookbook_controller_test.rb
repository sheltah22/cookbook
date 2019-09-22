require 'test_helper'

class CookbookControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Cookbook"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get add_recipe" do
    get add_recipe_url
    assert_response :success
    assert_select "title", "Add Recipe | #{@base_title}"
  end

  test "should get advanced_search" do
    get advanced_search_url
    assert_response :success
    assert_select "title", "Advanced Search | #{@base_title}"
  end

  test "should get saved_recipes" do
    get saved_recipes_url
    assert_response :success
    assert_select "title", "Saved Recipes | #{@base_title}"
  end
end
