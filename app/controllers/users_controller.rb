class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @subscriptions = @user.following_users
    @subscribers = @user.user_followers
    # we want posts from ourselves plus every user to whom we are
    # subscribed
    poster_ids = [params[:id]] + @subscriptions.map(&:id)
    @posts = Post.where(user_id: poster_ids).order('created_at desc')
  end

  def follow
    @follower = User.find params[:user_id]
    @followed = User.find params[:id]
    @follower.follow(@followed)
    flash[:notice] = "Following #{@followed.first_name} #{@followed.last_name}"
    redirect_to :back
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = user.find params[:id]
    @user.update_attributes user_params
    # redirect_to user_path(@user)
  end

  def destroy
    @user = user.find params[:id]
    @user.delete
    # redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name
    )
  end
end
