class VotesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@vote = @post.votes.new(post_id: @post.id) 
		@vote.ip_address = request.remote_ip
	
		if @vote.save  # validations called here
		    flash[:success] = "Thanks for voting" #{@post.title}
			redirect_to post_path(@post)
		else
			flash[:error] = "Oops, error"
			redirect_to post_path(@post)
		end
	end
end
