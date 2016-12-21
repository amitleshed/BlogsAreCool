class UsersController < ApplicationController

  def show
    find_user
    @comment = Comment.new
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @users = tag.users
  end

  def vote
   @article = Article.find(params[:article_id])
    if current_user.voted?(@article.id)
      redirect_to :back
    else
    current_user.vote(@article.id)
    redirect_to :back
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
