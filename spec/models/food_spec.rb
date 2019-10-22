require 'rails_helper'

describe Food do
  before(:each) do
    @food = Food.create(name: "Flour")
  end

  it "should be valid" do
    expect(@food).to be_valid
  end

  it "name should be present" do
    @food.name = "   "
    expect(@food).to_not be_valid
  end

  it "name should be unique" do
    @new_food = Food.new(name: "Flour")
    expect(@new_food).to_not be_valid
  end

  it "saves name as captialized" do
    @food.name = "flOuR"
    @food.save
    expect(@food.name).to eq("Flour")
  end
end
