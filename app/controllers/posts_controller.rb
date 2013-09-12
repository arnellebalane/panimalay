class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user_info = @post.user.user_info
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).filename
    else
      @profpic = "default.jpg"
    end
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
