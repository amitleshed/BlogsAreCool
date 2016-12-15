class WelcomeController < ApplicationController
  def index
    @users = User.all.order('username DESC')
    @articles = Article.all
    @comment = Comment.new

    if params[:search]
      @users = User.search(params[:search])
    end
  end
end
