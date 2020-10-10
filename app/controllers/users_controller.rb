class UsersController < ApplicationController
  def edit
    @user = current_user
  end
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを編集しました"
    else
      render :edit
    end
  end
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email, :icon, :name, :profile, :make_tool, :youtube_channel)
  end
end
