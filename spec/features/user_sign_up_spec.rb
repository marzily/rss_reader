require 'rails_helper'

RSpec.describe "user sign up page", type: :feature do
  before(:each) { visit new_user_path }

  scenario "sign up page has header and title" do
    expect(page).to have_content "NY Times RSS Reader"
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

  scenario "on successful sign up, user is redirected to news feed" do
    fill_in "Email",                 with: "margie@email.com"
    fill_in "Password",              with: "halloween"
    fill_in "Password confirmation", with: "halloween"
    click_button "Sign Up"

    expect(current_path).to eq articles_path
    expect(page).to have_content "Latest News"
  end

  context "site access for existing users" do
    let(:user) do
      User.create(email:                 "margie@email.com",
                  password:              "halloween",
                  password_confirmation: "halloween")
    end

    scenario "user is redirected to news feed if they are already signed in" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_user_path

      expect(current_path).to eq articles_path
    end
  end
end
