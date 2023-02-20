class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    search
    @posts = @q.result
    @post = Post.new
  end

  def show
    redirect_to posts_path unless @post.user_id == current_user.id
  end

  def new
    @post = Post.new
  end

  def edit
    redirect_to posts_path unless @post.user_id == current_user.id
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def create
    search
    @posts = @q.result
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.start_time = @post.deadline
    respond_to do |format|
      if @post.save
        format.html{redirect_to posts_month_path}
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post), notice: '投稿できませんでした...' }
      end
    end
  end

  def update
    search
    @posts = @q.result
    respond_to do |format|
      if @post.update(post_params)
        @post.update(start_time: @post.deadline)
        flash.now[:notice] = 'コメントが編集されました'
        format.html{redirect_to posts_month_path}
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    search
    @posts = @q.result
    @post.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.html{redirect_to posts_month_path}
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
    params.require(:post).permit(:content, :deadline, :status, :tag_ids)
  end
end
