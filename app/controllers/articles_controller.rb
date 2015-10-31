class ArticlesController < ApplicationController
  def index
  end

  def create
    @article = Article.new_with_uid(article_params, current_user)

    if @article.save
      render json: @article
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    render nothing: true
  end

  private

    def article_params
      params.require(:article).permit(:title, :url)
    end
end
