class FunController < ApplicationController
  def index
    @posts = Post.all
    @avatars = Avatar.all
    # @avatar = avatar.find params[:user_id]
    @users = User.all
  end

private
  def post_params
    params.require(:post).permit(
      :content
      )
  end
end

private
  def avatar_params
    params.require(:avatar).permit(
      :src,
      :user_id
      )
  end

private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name
    )
  end
