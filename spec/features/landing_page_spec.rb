require 'rails_helper'

RSpec.describe "landing/login page", type: :feature do
  before(:each) do
    User.create(email:                 "margie@email.com",
                password:              "halloween",
                password_confirmation: "halloween")
                
    visit root_path
  end

  scenario "sign up page has header and title" do
    expect(page).to have_content "NY Times RSS Reader"
    expect(page).to have_content "Log In"
  end

  scenario "landing page has form to log in" do
    expect(page).to have_css("form")

    within "form" do
      expect(page).to have_content "Email"
      expect(page).to have_content "Password"
    end
  end

  scenario "user sees error message if login info is invalid" do
    fill_in "Email",                 with: "margie@email.com"
    fill_in "Password",              with: "hello"
    click_button "Log In"

    expect(page).to have_content "Invalid login."
  end

  scenario "there is a link to sign up for new users" do
    expect(page).to have_link "Sign up"

    click_link "Sign up"
    expect(current_path).to eq new_user_path
  end

  scenario "on successful login, user is redirected to news feed" do
    fill_in "Email",                 with: "margie@email.com"
    fill_in "Password",              with: "halloween"
    click_button "Log In"

    expect(current_path).to eq news_index_path
    expect(page).to have_content "Latest News"
  end

  scenario "user is redirected to news feed if they are already signed in" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.last)
    visit root_path

    expect(current_path).to eq news_index_path
  end
end
