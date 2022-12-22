class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    search
    @posts = @q.result
  end

  def show
    redirect_to posts_path unless @post.user_id == current_user.id
  end

  def new
    @post = Post.new
  end

  def edit
    redirect_to posts_path unless @post.user_id == current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: '新しいToDoが作成されました'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'ToDoが編集されました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'ToDoが削除されました。'
  end

  private

  def search
    @q = current_user.posts.ransack(params[:q])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :deadline, :tag_ids)
  end
end
