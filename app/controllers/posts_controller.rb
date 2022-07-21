class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy new]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :post_count_updated, only: %i[update]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def edit
    currently_editing(current_user.id, Time.zone.now) if @post.current_editor.nil?
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.current_editor == current_user.id
      currently_editing(nil, nil) if updating?
      currently_editing(nil, nil) if publishing?
    end


    respond_to do |format|
      if @post.save
        # UserMailer.with(user: @user).welcome_email.deliver_later
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
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to post_url(@post), notice: 'Публикация была обновлена' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to post_url(@post), alert:  'Количество редакций публикации превысило - 5'
    end

  end


  def destroy
    @post.destroy
    # authorize! :destroy, @post
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Публикация была удалена' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def post_count_updated
    if @post.count_update < 5
      @post.count_update += 1
    end
  end

  def currently_editing(editor, time)
    @post.current_editor = editor
    @post.editing_started_at = time
    @post.save
  end

end
