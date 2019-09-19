require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout_links" do
    get root_path
    assert_template 'cookbook/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", advanced_search_path
    assert_select "a[href=?]", add_recipe_path
    assert_select "a[href=?]", saved_recipes_path
  end
end
