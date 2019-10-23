require 'rails_helper'

describe Variety do
  before(:each) do
    @variety = Variety.create(name: "Volume")
  end

  it "should be valid" do
    expect(@variety).to be_valid
  end

  it "name should be present" do
    @variety.name = "   "
    expect(@variety).to_not be_valid
  end

  it "name should be unique" do
    @new_variety = Variety.new(name: "Volume")
    expect(@new_variety).to_not be_valid
  end

  it "saves name as captialized" do
    @variety.name = "vOluME"
    @variety.save
    expect(@variety.name).to eq("Volume")
  end

  it "measurements are destroyed with variety" do
    @measurement = @variety.measurements.create(name: "cups")
    expect { @variety.destroy }.to change(Measurement, :count).by(-1)
  end

  it "foods are destroyed with food" do
    @food = @variety.foods.create(name: "flour")
    expect { @variety.destroy }.to change(Food, :count).by(-1)
  end
end
