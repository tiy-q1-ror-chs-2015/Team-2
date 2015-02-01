class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @posts = @user.posts
    # TODO: actually implement friends
    @friends = []
    12.times do
      random_user = User.find(rand(100)+1)
      @friends.push(random_user)
    end
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
