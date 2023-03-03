class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    redirect_to posts_path unless @user == current_user
  end

  def line_disconnect
    user = User.find_by(id: current_user.id)
    user.update!(provider: nil, uid: nil)
    redirect_to user_path(current_user.id)
  end
end
