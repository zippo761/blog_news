class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[update destroy]


  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.referrer, notice: 'Комментарий создан' }
        format.json { head :no_content }
      else
        format.html { redirect_to post_path(@post), notice: 'Комментарий не может быть пустым или содержать больше 200 символов' }
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

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to request.referrer, notice: 'Комментарий обновлен' }
      else
        render 'edit'
      end
    end
  end

  private def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
