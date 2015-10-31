class ArticlesController < ApplicationController
  def index
  end

  def create
    @article = Article.new_with_uid(article_params, current_user)

    if @article.save
      render json: @article
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :url)
    end
end
