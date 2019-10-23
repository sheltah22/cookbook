require 'rails_helper'

describe Measurement do
  before(:each) do
    @measurement = Measurement.create(name: "cup")
  end

  it "should be valid" do
    expect(@measurement).to be_valid
  end

  it "name should be present" do
    @measurement.name = "   "
    expect(@measurement).to_not be_valid
  end

  it "name should be unique" do
    @new_measurement = Measurement.new(name: "cup")
    expect(@new_measurement).to_not be_valid
  end

  it "saves name as lowercase" do
    @measurement.name = "cUP"
    @measurement.save
    expect(@measurement.name).to eq("cup")
  end
end
