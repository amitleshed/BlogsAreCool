class UsersController < ApplicationController

  def show
    find_user
  end

  def vote
    @article = Article.find(params[:article_id])
    current_user.vote(@article.id)
    redirect_to :back
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
