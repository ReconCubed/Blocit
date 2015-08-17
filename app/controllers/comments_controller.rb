class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Please try again in a few seconds."
      redirect_to [@topic, @post]
    end
  end
  private 
  def comment_params
    params.require(:comment).permit(:body)
  end
end
