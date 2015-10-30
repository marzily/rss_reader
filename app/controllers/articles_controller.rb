class ArticlesController < ApplicationController
  def index
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:message] = "Thanks for signing up!"
      redirect_to articles_path
    else
      render :new
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :password, :password_confirmation)
    end

end
