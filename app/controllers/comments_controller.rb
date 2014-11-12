class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params) 
		if @comment.save
		    flash[:success] = "Thanks for commenting" #{@post.title}
			redirect_to post_path(@post)
		else
			flash[:error] = "Oops, error"
			redirect_to post_path(@post)
		end
	end
	private
	def comment_params 
		params.require(:comment).permit(:body,:post_id)
	end
end
