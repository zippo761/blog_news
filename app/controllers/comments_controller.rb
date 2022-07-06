class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comments_url(@comment), notice: 'Комментарий создан' }
        format.json { head :no_content }
      end
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Комментарий удален' }
      format.json { head :no_content }
    end

  end

  private def comment_params
    params.require(:comment).permit(:username, :content)
  end

end
