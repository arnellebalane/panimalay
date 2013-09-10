class PostsController < ApplicationController
  def show
  end

  def create
  	@post = Post.new(content: params[:post][:content], user_id: session[:user_id])
  	@post.save
  	redirect_to board_index_path
  end

  def destroy

  end
end
