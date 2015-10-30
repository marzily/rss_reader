require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) do
    User.create(email: "email@email.com",
                password: "password",
                password_confirmation: "password")
  end

  let(:article) do
    Article.new(title: "Dentists give toothbrushes out on Halloween",
                user_id: user.id)
  end

  scenario "article is valid" do
    expect(article).to be_valid
  end

  scenario "article is invalid without a title" do
    article.title = nil

    expect(article).to_not be_valid
  end

  scenario "article is invalid without a user id" do
    article.user_id = nil
    
    expect(article).to_not be_valid
  end
end
