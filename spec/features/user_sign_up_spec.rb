require 'rails_helper'

RSpec.describe "user sign up page", type: :feature do
  before(:each) { visit new_user_path }

  scenario "sign up page has title" do
    expect(page).to have_content "Sign Up"
  end

  scenario "sign up page has form to enter new user info" do
    num_users = User.count

    fill_in "Email",                 with: "margie@email.com"
    fill_in "Password",              with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign Up"

    expect(User.count).to eq(num_users + 1)
  end

  scenario "user sees error message if form data is invalid" do
    fill_in "Email",                 with: "margie@email.com"
    fill_in "Password",              with: "hello"
    fill_in "Password confirmation", with: "hello"
    click_button "Sign Up"

    expect(page).to have_content "Password is too short (minimum is 8 characters)"
  end

  scenario "same user cannot sign up twice" do
    fill_in "Email",                 with: "margie@email.com"
    fill_in "Password",              with: "helloworld"
    fill_in "Password confirmation", with: "helloworld"
    click_button "Sign Up"

    expect(page).to have_content "Email has already been taken"
  end
end
