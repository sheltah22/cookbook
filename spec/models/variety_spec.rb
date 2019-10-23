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
end
