class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: t('notice.update')
    else
      render :edit
    end
  end
  def show
    @user = User.find(params[:id])
    @eventrooms = current_user.eventrooms
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def eventrooms
    @user = User.find(params[:id])
    @events = @user.events
    @eventrooms = current_user.eventrooms
  end

  def event_index
    @user = User.find(params[:id])
    @events = @user.events
  end

  private
  def user_params
    params.require(:user).permit(:id, :email, :icon, :icon_cache, :remove_icon, :name, :profile, :make_tool, :youtube_channel)
  end
end
