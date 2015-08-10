class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: 'Comment created'
    else
      redirect_to @post, notice: 'Comment failed'
    end
  end
  private 
  def comment_params
    params.require(:comment).permit(:body)
  end
end
