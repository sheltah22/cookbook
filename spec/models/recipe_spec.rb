require 'rails_helper'

describe Recipe do
  before(:each) do
    @user = User.create(name: "Example User", email: "user@example.com",
                        password: "foobarbar", password_confirmation: "foobarbar")
    @recipe = @user.recipes.build(title: "Recipe 1", content: "This is a recipe.")
  end

  it "should be valid" do
    expect(@recipe).to be_valid
  end

  it "user id should be present" do
    @recipe.user_id = nil
    expect(@recipe).to_not be_valid
  end

  it "title should be present" do
    @recipe.title = "  "
    expect(@recipe).to_not be_valid
  end

  it "content should be present" do
    @recipe.content = "  "
    expect(@recipe).to_not be_valid
  end

  it "order should be most recent first" do
    @recipe.save
    @recent = @user.recipes.create(title: "Most Recent", content: "Lorem ipsum")
    expect(Recipe.first).to eq(@recent)
  end
end
