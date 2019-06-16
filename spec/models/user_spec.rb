# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end

  it "is valid when build form factory" do
    expect(@user1).to be_valid
  end

  it "is valid when build form random factory" do
    user2 = build(:random_user)
    expect(user2).to be_valid
  end

  it "has a unique email" do
    user2 = build(:user)
    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do
    user2 = build(:random_user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without an email" do
    user2 = build(:random_user, email: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid when password is shorter than 6" do
    user2 = build(:random_user, password: "as")
    expect(user2).to_not be_valid
  end

  it "is not valid when email is without @" do
    email = "zulbartek"
    expect(email).not_to match(/^\W+@\W+$/)
    user2 = build(:random_user, email: email)
    expect(user2).to_not be_valid
  end
end

it "is not valid when pesel is shorter than 11" do
  pesel = "7897"
  expect(pesel).not_to match(/\d{11}/)
  user2 = build(:random_user, pesel: "7897")
  expect(user2).to_not be_valid
end

it "is not valid without a pesel" do
  user2 = build(:random_user, pesel: nil)
  expect(user2).to_not be_valid
end

it "is valid without a pesel" do
  user2 = build(:random_user, pesel: nil)
  expect(user2).to be_valid
end
