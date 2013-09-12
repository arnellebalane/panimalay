class CommentsController < ApplicationController

	def create
		@name = params[:comment][:parent_class_name]
		@id = params[:comment][:parent_id]
		@content = params[:comment][:content]

		if @name == "Post"
			@post = Post.find(@id)
			@comment = @post.comments.create(:content => @content, :commentable_id => @id, :user_id => session[:user_id])
			if !@comment
				flash[:alert] = @comment.errors.full_messages[0]
			end
			redirect_to post_path(@post.id)
		elsif @name == "Photo"

		else
			redirect_to board_index_path
		end
	end

	def destroy

	end

end
