class CommentsController < ApplicationController

	def create
		@name = params[:comment][:parent_class_name]
		@id = params[:comment][:parent_id]
		@content = params[:comment][:content]

		if @name == "Post"
			@post = Post.find(@id)
			@comment = @post.comments.create(content: @content, commentable_id: @id, user_id: session[:user_id])
			if !@comment
				flash[:alert] = @comment.errors.full_messages[0]
			end
			redirect_to :back
			# redirect_to post_path(@post.id)
		elsif @name == "Photo"
			@photo = Photo.find(@id)
			@comment = @photo.comments.create(content: @content, commentable_id: @id, user_id: session[:user_id])
			if !@comment
				flash[:alert] = @comment.errors.full_messages[0]
			end
			redirect_to :back
		else
			flash[:alert] = "An error has occured while adding the comment."
			redirect_to :back
			# redirect_to board_index_path
		end
	end

	def destroy

	end

end
