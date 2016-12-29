class WelcomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to discover_path
    end
    @users = User.all.order('username DESC')
    @comment = Comment.new

    if params[:search]
      @users = User.search(params[:search])
    end
  end
  
  def discover
    @users = User.all.order('username DESC')
    @comment = Comment.new

    if params[:search]
      @users = User.search(params[:search])
    end

  end
end
