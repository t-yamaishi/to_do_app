class TagsController < ApplicationController
  before_action :set_tag, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @tags = Tag.all
  end

  def show; end

  def new
    @tag = Tag.new
  end

  def edit; end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag, notice: 'タグが作成されました。'
    else
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: 'タグが編集されました。'
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'タグが削除されました。'
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def admin_user
    redirect_to user_path(current_user.id) unless current_user.admin?
  end
end
