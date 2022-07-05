class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      flash[:success] = 'Комментарий создан'
      redirect_to post_url(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @post, notice: "Комментарий удален" }
      format.json { head :no_content }
    end

  end

  private def comment_params
    params.require(:comment).permit(:username, :content)
  end

end
