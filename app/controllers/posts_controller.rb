class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :search, only: %i[index create update destroy]
  before_action :authenticate_user!

  def index
    @posts = @q.result.page(params[:page]).per(20)
    @post = Post.new
  end

  def edit
    redirect_to posts_path unless @post.user_id == current_user.id
    respond_to do |format|
      flash.now[:notice] = 'ToDo編集中です'
      format.js { render :edit }
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.start_time = @post.deadline
    @posts = @q.result
    respond_to do |format|
      if @post.save
        flash.now[:notice] = 'ToDoが作成されました'
        format.js { render :index }
      else
        format.js { render :error }
      end
    end
  end

  def update
    @posts = @q.result
    respond_to do |format|
      if @post.update(post_params)
        @post.update!(start_time: @post.deadline)
        flash.now[:notice] = 'ToDoが編集されました'
        format.js { render :index }
      else
        format.js { render :error }
      end
    end
  end

  def destroy
    @posts = @q.result
    @post.destroy!
    respond_to do |format|
      flash.now[:notice] = 'ToDoが削除されました'
      format.js { render :index }
    end
  end

  def ajax_index
    search
    @posts = @q.result
    respond_to do |format|
      format.js { render :index }
    end
  end

  def month
    @posts = current_user.posts
    @post = Post.new
  end

  private

  def search
    @q = current_user.posts.ransack(params[:q])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :deadline, :status, {tag_ids: []})
  end
end
