require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    User.new(email:                 "margie@email.com",
             password:              "password",
             password_confirmation: "password")
  }

  scenario "user is valid" do
    expect(user).to be_valid
  end

  scenario "user is invalid if email is not valid" do
    user.email = "m"

    expect(user).to_not be_valid
  end

  scenario "user is invalid if email is not unique" do
    user.save
    user2 = User.new(email:                 "margie@email.com",
                     password:              "password",
                     password_confirmation: "password")

    expect(user2).to_not be_valid
  end

  scenario "user is invalid if password is not provided" do
    user.password = nil

    expect(user).to_not be_valid
  end

  scenario "user is invalid if password length is less than 8" do
    user.password = "hello"

    expect(user).to_not be_valid
  end

  scenario "user is invalid if password confirmation is not provided" do
    user.password_confirmation = nil

    expect(user).to_not be_valid
  end

  scenario "user is invalid if password confirmation is not correct" do
    user.password_confirmation = "world"

    expect(user).to_not be_valid
  end

  scenario "user has favorite articles" do
    expect(user).to respond_to(:articles)
  end
end
