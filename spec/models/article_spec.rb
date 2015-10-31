require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) do
    User.create(email: "email@email.com",
                password: "password",
                password_confirmation: "password")
  end

  let(:article) do
    Article.new(title: "Consumer Spending Posts Smallest Gain in 8 Months",
                url: "http://www.nytimes.com/2015/10/31/business/economy/consumer-spending-posts-smallest-gain-in-8-months.html",
                user_id: user.id)
  end

  scenario "article is valid" do
    expect(article).to be_valid
  end

  scenario "article is invalid without a title" do
    article.title = nil

    expect(article).to_not be_valid
  end

  scenario "article is invalid without a url" do
    article.url = nil

    expect(article).to_not be_valid
  end

  scenario "article is invalid without a user id" do
    article.user_id = nil

    expect(article).to_not be_valid
  end

  scenario "articles can be created from controller params" do
    params = { title: "The Link Between Parenting and Leadership",
               url: "http://www.nytimes.com/2015/10/31/business/dealbook/the-link-between-parenting-and-leadership.html" }
    article2 = Article.new_with_uid(params, user)

    expect(article2).to be_valid
  end
end
