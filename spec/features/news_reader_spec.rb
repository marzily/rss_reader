require 'rails_helper'

RSpec.describe "news reader", type: :feature, js: true do
  before(:each) do
    User.create(email:                 "margie@email.com",
                password:              "halloween",
                password_confirmation: "halloween")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.last)
    visit articles_path
  end

  scenario "it has a header and a title" do
    expect(page).to have_content "NY Times RSS Reader"
    expect(page).to have_content "Latest News"

  end

  scenario "it displays the latest headlines" do

  end


end
