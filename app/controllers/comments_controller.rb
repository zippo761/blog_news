class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  include CommentsHelper

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comments_url(@comment), notice: 'Комментарий создан' }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Комментарий удален' }
      format.json { head :no_content }
    end

  end

  private def comment_params
    params.require(:comment).permit(:username, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_owner
    unless is_owner(@comment)
      flash[:alert] = "Запрещено редактировать чужой контент"
      redirect_to  posts_path
    end
  end


end
