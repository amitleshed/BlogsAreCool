class UsersController < ApplicationController

  def show
    find_user
    @comment = Comment.new
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @tag = tag
    @users = tag.users
  end

  def follow
    current_user.follow(params[:follow_id])
    redirect_to :back
  end

  def unfollow
    current_user.unfollow(params[:follow_id])
    redirect_to :back
  end

  def vote
   article = Article.find(params[:article_id])
    if current_user.voted?(article.id)
      respond_to do |format|
        format.js 
        format.html { redirect_to :back }
      end
    else
    current_user.vote(article.id)
      respond_to do |format|
        format.js 
        format.html { redirect_to :back }
      end
    end
  end

    def favorite
      unless user_signed_in?
        redirect_to discover_path
      end
      @comment = Comment.new
    end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
