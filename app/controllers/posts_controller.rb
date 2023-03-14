class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :search, only: %i[index create update destroy]

  def index
    @post = Post.new
    respond_to do |format|
      format.html { render :index }
      format.js { render :index }
    end
  end

  def edit
    redirect_to posts_path unless @post.user_id == current_user.id
    flash.now[:notice] = 'ToDo編集中です'
    render :edit
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.start_time = @post.deadline
    if @post.save
      flash.now[:notice] = 'ToDoが作成されました'
      render :index
    else
      render :error_for_create
    end
  end

  def update
    if @post.update(post_params)
      @post.update!(start_time: @post.deadline)
      flash.now[:notice] = 'ToDoが編集されました'
      render :index
    else
      render :error_for_update
    end
  end

  def destroy
    @post.destroy!
    flash.now[:notice] = 'ToDoが削除されました'
    render :index
  end

  def month_calendar
    @posts = current_user.posts
    @post = Post.new
  end

  private

  def search
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(10)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :deadline, :status, {tag_ids: []})
  end
end
