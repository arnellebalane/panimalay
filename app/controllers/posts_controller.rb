class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user_info = @post.user.user_info
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).filename
    else
      @profpic = "default.jpg"
    end
  end

  def create
    if (params[:post][:photo])
      valid_filetypes = ["jpg", "png", "jpeg", "bmp", "gif"];
      filetype = params[:post][:photo].original_filename.split('.').last
      if valid_filetypes.include?(filetype.downcase)
        filetype = "." + filetype
        myString = "thequickbrownfoxjumpsoverthelazydogTHEQUICKBROWNFOXJUMPSOVERTHELAZYDOG1234567890"
        filename = "";
        while(filename == "" or Photo.where("filename = ?", filename).count > 0)
          filename = ""
          20.times do 
            filename += myString[rand(myString.length)]
          end
          filename += filetype
        end
        File.open(Rails.root.join('public', 'photos', filename), 'wb') do |file|
          file.write(params[:post][:photo].read)
        end
        photo = Photo.create(filename: filename, caption: params[:post][:content], user_id: session[:user_id])
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