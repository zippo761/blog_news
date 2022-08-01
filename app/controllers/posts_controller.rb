class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy new]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :post_count_updated, only: %i[update]
  load_and_authorize_resource

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @comments = @post.comments.all
    # TODO unset current editor if user cancel edit or visit /show
    if user_signed_in?
      if @post.current_editor == current_user.id
        unset_current_editor(nil)
      end
    end
  end

  def new
    @post = Post.new
  end

  def edit
    # user name for show who last update post
    user_name = current_user.name
    currently_editing(current_user.id, user_name) if @post.current_editor.nil? # TODO set current editor if current editor nil
  end

  def create
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Создана новая публикация' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @post.count_update < 5
      if @post.current_editor == current_user.id  
				respond_to do |format|
					if @post.update(post_params)
						# after update post unset current editor
						currently_editing(nil)
						format.html { redirect_to post_url(@post), notice: 'Публикация была обновлена' }
						format.json { render :show, status: :ok, location: @post }
					else
						format.html { render :edit, status: :unprocessable_entity }
						format.json { render json: @post.errors, status: :unprocessable_entity }
					end
				end
			else
				redirect_to post_url(@post), alert: 'Обновление публикации не возможно, в данный момент она редактируется'
      end
    else
      redirect_to post_url(@post), alert: 'Количество редактирований публикации превысило - 5'
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Публикация была удалена' }
      format.json { head :no_content }
    end
  end

  private


  def set_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :content)
  end

  def post_count_updated
    @post.count_update += 1 if @post.count_update < 5
  end

  def currently_editing(editor, user_name = current_user.name)
    # set current editor #when user visit edit
    @post.current_editor = editor
    @post.user_last_update = user_name
    @post.save
  end

  def unset_current_editor(editor)
    # unset current editor #if user dont update post
    @post.current_editor = editor
    @post.save
  end
end
