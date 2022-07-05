class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html{ redirect_to posts_path}
    end
  end

  def show
    @comments = @post.comment.all.order(created_at: :desc)
  end

  private def comment_params
    params.require(:comment).permit(:username, :content)
  end

end
