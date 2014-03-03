require 'spec_helper'

describe User do
  before(:each) do
    @user = User.create(first_name: "Joe", last_name: "Bloggs", username: "jbloggs", password: "password", password_confirmation: "password", email: "jbloggs@example.com")
  end

  it "creates a user when valid details are provided" do
    expect(@user).to be_valid
  end

  it "gives an error if username is already taken" do
    user2 = User.create(first_name: "Jane", last_name: "Bloggs", username: "jbloggs", password: "password", password_confirmation: "password", email: "janebloggs@example.com")
    expect(user2).to_not be_valid
  end

  it "gives an error if email is already taken" do
    user2 = User.create(first_name: "Jane", last_name: "Bloggs", username: "janebloggs", password: "password", password_confirmation: "password", email: "jbloggs@example.com")
    expect(user2).to_not be_valid
  end

  it "gives an error if email is malformed" do
    user2 = User.create(first_name: "Jane", last_name: "Bloggs", username: "janebloggs", password: "password", password_confirmation: "password", email: "jbloggs@exa")
    expect(user2).to_not be_valid
  end

  it "gives an error if password is too short" do
    user2 = User.create(first_name: "Jane", last_name: "Bloggs", username: "janebloggs", password: "pwd", password_confirmation: "pwd", email: "jbloggs@example.com")
    expect(user2).to be_valid
  end

  it "gives an error if password and password confirmation do not match" do
    user2 = User.create(first_name: "Jane", last_name: "Bloggs", username: "janebloggs", password: "password", password_confirmation: "pwd", email: "jbloggs@example.com")
    expect(user2).to_not be_valid
  end

  it "has many sketches" do
    sketch = @user.sketches.create()
    expect(@user.sketches).to eq(sketch)
  end
end
