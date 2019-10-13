require 'rails_helper'

describe User do
  before(:each) do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobarbar", password_confirmation: "foobarbar")
  end

  it "should be valid with proper attributes" do
    expect(@user).to be_valid
  end

  it "name should be present" do
    @user.name = '        '
    expect(@user).to_not be_valid
  end

  it "email should be present" do
    @user.email = '          '
    expect(@user).to_not be_valid
  end

  it "name should not be too long" do
    @user.name = 'a' * 51
    expect(@user).to_not be_valid
  end

  it "email should not be too long" do
    @user.email = 'a' * 244 + '@example.com'
    expect(@user).to_not be_valid
  end

  it "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid
    end
  end

  it "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).to_not be_valid
  end

  it "email addresses should be saved as lowercase" do
    @user.email = "USER@EXAMPLE.com"
    @user.save
    expect(@user.email).to eq("user@example.com")
  end

  it "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to_not be_valid
  end

  it "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    expect(@user).to_not be_valid
  end

  it "dependent recipes should be destroyed" do
    @user.save
    @user.recipes.create!(title: "Recipe", content: "Lorem ipsum")
    expect { @user.destroy }.to change(Recipe, :count).by(-1)
  end
end
