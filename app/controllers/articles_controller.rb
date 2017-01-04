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

  def favorite
    @article = Article.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @article
      redirect_to :back, notice: 'You favorited #{@article.title}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@article)
      redirect_to :back, notice: 'Unfavorited #{@article.title}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :description)
    end
    
end
