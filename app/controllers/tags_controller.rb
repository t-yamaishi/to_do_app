class TagsController < ApplicationController
  before_action :set_tag, only: %i[edit update destroy]
  def index
    @tags = current_user.tags
    @tag = Tag.new
  end

  def edit
    flash.now[:notice] = 'タグ編集中です'
    render :edit
  end

  def create
    @tag = current_user.tags.build(tag_params)
    @tags = current_user.tags
    if @tag.save
      flash.now[:notice] = 'タグを作成しました'
      render :index
    else
      render :error_for_create
    end
  end

  def update
    @tags = current_user.tags
    if @tag.update(tag_params)
      flash.now[:notice] = 'タグを更新しました'
      render :index
    else
      render :error_for_update
    end
  end

  def destroy
    @tags = current_user.tags
    @tag.destroy!
    flash.now[:notice] = 'タグを削除しました'
    render :index
  end

  private

  def set_tag
    @tag = current_user.tags.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
