class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user_info = @post.user.user_info
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).id.to_s
    else
      @profpic = "0"
    end
  end

  def create
    if (params[:post][:photo])
      file_type = params[:post][:photo].original_filename.split(".").last.downcase
      if ["png", "jpg", "jpeg", "gif", "bmp"].include? file_type
        myString = "thequickbrownfoxjumpsoverthelazydogTHEQUICKBROWNFOXJUMPSOVERTHELAZYDOG1234567890"
        filename = "#{Array.new(20) { myString[rand(myString.length)] }.join}.#{file_type}"
        while Photo.where(:filename => filename).count > 0
          filename = "#{Array.new(20) { myString[rand(myString.length)] }.join}.#{file_type}"
        end
        photo = Photo.create(
          :filename => filename,
          :caption => params[:post][:content],
          :user_id => session[:user_id],
          :mime_type => params[:post][:photo].content_type
        )
        binary = Binary.create(:data => params[:post][:photo].read, :photo_id => photo.id)
        flash[:notice] = "Posted!"
      else
        flash[:alert] = "Invalid File!"
      end
    else
      @post = Post.new(content: params[:post][:content], user_id: session[:user_id])
      if not @post.save
        flash[:alert] = "Post is empty!"
      else 
        flash[:notice] = "Posted!"
      end
    end
  	redirect_to :back
  end

  def destroy

  end
end