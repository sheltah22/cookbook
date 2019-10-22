require 'rails_helper'

describe DishType do
  before(:each) do
    @dish_type = DishType.create(name: "Entree")
  end

  it "should be valid" do
    expect(@dish_type).to be_valid
  end

  it "name should be present" do
    @dish_type.name = "   "
    expect(@dish_type).to_not be_valid
  end

  it "name should be unique" do
    @new_type = DishType.new(name: "Entree")
    expect(@new_type).to_not be_valid
  end

  it "saves name as captialized" do
    @dish_type.name = "ENTrEe"
    @dish_type.save
    expect(@dish_type.name).to eq("Entree")
  end
end
