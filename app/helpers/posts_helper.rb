module PostsHelper
    def recent_posts(num_posts)
      Post.find(:all, :order => "created_at desc", :limit => num_posts)
    end

end