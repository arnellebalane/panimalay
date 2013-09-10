class PostsController < ApplicationController
  def show
  end

  def create
  	@post = Post.new(content: params[:post][:content], user_id: session[:user_id])
  	if not @post.save
  		flash[:alert] = "Post is empty!"
  	end
  	redirect_to board_index_path
  end

  def destroy

  end
end
