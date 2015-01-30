class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@posts = Post.all
	end

	def create
		@post = Post.create post_params
	end

	def edit
		@post = Post.find params[:id]
	end

	def show
		@post = Post.find params[:id]
	end

	def create
		@post = Post.new(post_params)
			if @post.save
				flash[:notice] = "post has been successfully saved"
				redirect_to hpost_path
			else
				flash[:error] = "post was not saved"
			end
	end

	def update
		@post = Post.find params[:id]
		@post.update(post_params)
			if @post.save
    	flash[:notice] = 'post data was successfully created.'
    	redirect_to post_path
    else
    	flash[:error] = "post data was NOT saved."
    	render :new
		end
	end

	def destroy
		@post = Post.find params[:id]
		@post.destroy
		redirect_to user_path
	end

private
	def post_params
		params.require(:post).permit(
			:content
			)
	end
end