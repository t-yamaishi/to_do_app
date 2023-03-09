class TagsController < ApplicationController
  before_action :set_tag, only: %i[edit update destroy]

  def index
    @tags = current_user.tags
    @tag = Tag.new
  end

  def edit
    respond_to do |format|
      flash.now[:notice] = 'タグ編集中です'
      format.js { render :edit }
    end
  end

  def create
    @tag = current_user.tags.build(tag_params)
    @tags = current_user.tags
    respond_to do |format|
      if @tag.save
        flash.now[:notice] = 'タグを作成しました'
        format.js { render :index }
      else
        format.js { render :error_for_create }
      end
    end
  end

  def update
    @tags = current_user.tags
    respond_to do |format|
      if @tag.update(tag_params)
        flash.now[:notice] = 'タグを更新しました'
        format.js { render :index }
      else
        format.js { render :error_for_update }
      end
    end
  end

  def destroy
    @tags = current_user.tags
    @tag.destroy!
    respond_to do |format|
      flash.now[:notice] = 'タグを削除しました'
      format.js { render :index }
    end
  end

  private

  def set_tag
    @tag = current_user.tags.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
