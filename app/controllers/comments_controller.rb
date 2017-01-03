class CommentsController < ApplicationController
  def create
    # @article = Article.find(params[:article_id])
    @comment = current_user.comments.build(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.save
      respond_to do |format|
        format.js 
        format.html { redirect_to :back }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @comment.save
    redirect_to :back
  end 

  private

  def comment_params
    params.require(:comment).permit(:description, :user_id, :article_id)
  end
    
end
