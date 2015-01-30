class UsersController < ApplicationController

  def index
    @users = user.find params
  end

  def show
    @user = User.find params[:id]
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
