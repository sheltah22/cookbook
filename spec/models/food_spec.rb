require 'rails_helper'

describe Food do
  before(:each) do
    @variety = Variety.create(name: "Weight")
    @food = @variety.foods.create(name: "flour")
  end

  it "should be valid" do
    expect(@food).to be_valid
  end

  it "name should be present" do
    @food.name = "   "
    expect(@food).to_not be_valid
  end

  it "name should be unique" do
    @new_food = @variety.foods.build(name: "flour")
    expect(@new_food).to_not be_valid
  end

  it "variety should be present" do
    @food.variety = nil
    expect(@food).to_not be_valid
  end

  it "saves name as lowercase" do
    @food.name = "flOuR"
    @food.save
    expect(@food.name).to eq("flour")
  end
end
