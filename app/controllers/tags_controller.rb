class TagsController < ApplicationController
  before_action :set_tag, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @tags = current_user.tags
  end

  def show; end

  def new
    @tag = Tag.new
  end

  def edit
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def create
    @tag = Tag.new(tag_params)
    @tags = Tag.all
    @tag.user_id = current_user.id
    respond_to do |format|
      if @tag.save
        format.js { render :index }
      else
        format.html { redirect_to tags_path, notice: '投稿できませんでした...' }
      end
    end
  end

  def update
    @tags = Tag.all
    respond_to do |format|
      if @tag.update(tag_params)
        format.js { render :index }
      else
        flash.now[:notice] = 'タグの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @tags = Tag.all
    @tag.destroy
    respond_to do |format|
      format.js { render :index }
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
