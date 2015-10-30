class ArticlesController < ApplicationController
  def index
  end

  def create
    @article = Article.add_user_id(article_params, current_user)

    render nothing: true if @article.save
  end

  private

    def article_params
      params.require(:article).permit(:title, :url)
    end
end
