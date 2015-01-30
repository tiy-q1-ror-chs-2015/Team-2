class DiscoverController < ApplicationController

#TODO: see PostHelper recent_posts
  def index
    @posts = Post.last(25)
  end

end