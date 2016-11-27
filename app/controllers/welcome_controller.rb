class WelcomeController < ApplicationController
  def index
    @users = User.all.order('username DESC')

    if params[:search]
      @users = User.search(params[:search])
    end
  end
end
