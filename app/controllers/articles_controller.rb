class ArticlesController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @articles = Article.search(params[:search])
  end

  def new
    @article = Article.new 
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to profiles_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :back
  end

  private

    def article_params
      params.require(:article).permit(:title, :description)
    end
    
end
