class DiscoverController < ApplicationController

  def index
    @posts = Post.last(25).reverse
    @post = Post.new
    @avatars = Avatar.all.last(25).reverse
  end

  #TODO: make the new post go into the database

  def create_post
    current_user.posts.create post_params
    redirect_to discover_path
  end

  def post_params
    params.require(:post).permit(
      :content
      )
  end

end