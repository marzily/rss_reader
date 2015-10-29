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
  #   fill_in "Email",                 with: "margie@email.com"
  #   fill_in "Password",              with: "halloween"
  #   fill_in "Password confirmation", with: "halloween"
  #   click_button "Sign Up"
  end

  scenario "user sees error message if log in info is invalid" do
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
end
