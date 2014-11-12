class PostsController < ApplicationController
	def index
		if params[:sort]
			if params[:sort] == 'top'
				@posts = Post.order("votes_count DESC")
			elsif params[:sort] == 'recent'
				@posts = Post.order("created_at DESC")
			elsif params[:sort] == 'featured'
				@posts = Post.where(is_featured:true)
			else
				@posts = Post.all
			end
		else
			@posts = Post.all
		end
	end
	def show
		@post = Post.find(params[:id])
		@votes = @post.votes
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Thanks for adding your post" #{@post.title}
			redirect_to post_path(@post)
		else
			flash[:error] = "Oops, error"
			render :new
		end
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:success] = "Thanks for updating your post"
			redirect_to post_path(@post)
		else
			flash[:error] = "Oops, error"
			render :new
		end
	end
	def destroy
	end
	private
	def post_params
		params.require(:post).permit(:title,:body,:url)
	end
end
