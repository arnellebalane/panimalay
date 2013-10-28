class PhotosController < ApplicationController
  skip_before_filter :require_login, :only => [:serve]

  def index
    @photo = Photo.new
    @photos = Photo.order("created_at DESC")
  end

	def create
		if (params[:photo][:photo])
  		file_type = params[:photo][:photo].original_filename.split(".").last.downcase
      if ["png", "jpg", "jpeg", "gif", "bmp"].include? file_type
        myString = "thequickbrownfoxjumpsoverthelazydogTHEQUICKBROWNFOXJUMPSOVERTHELAZYDOG1234567890"
        filename = "#{Array.new(20) { myString[rand(myString.length)] }.join}.#{file_type}"
        while Photo.where(:filename => filename).count > 0
          filename = "#{Array.new(20) { myString[rand(myString.length)] }.join}.#{file_type}"
        end
        photo = Photo.create(
          :filename => filename,
          :caption => params[:photo][:caption],
          :user_id => session[:user_id],
          :mime_type => params[:photo][:photo].content_type
        )
        binary = Binary.create(:data => params[:photo][:photo].read, :photo_id => photo.id)
        flash[:notice] = "Photo Uploaded!"
      else
        flash[:alert] = "Invalid File!"
      end
  	else
  		flash[:alert] = "Invalid File"
  	end
  	redirect_to :back
	end

  def get_photo
    photo = Photo.find(params[:id])
    result = {
      :photo => {
        :url => serve_photo_path(photo),
        :caption => photo.caption,
        :created_at => photo.created_at.strftime("%B %d, %Y")
      },
      :user => {
        :name => "#{photo.user.user_info.firstname} #{photo.user.user_info.lastname}"
      }
    }
    result[:user][:profile_picture] = if photo.user.user_info.photo_id.nil?
      serve_photo_path "0"
    else
      serve_photo_path Photo.find(photo.user.user_info.photo_id).id.to_s
    end
    render :json => result
  end

  def destroy
    photo = Photo.find(params[:id])
    user = User.find(session[:user_id])
    user_info = user.user_info
    if photo.user.id == session[:user_id]
      if user_info.photo_id == photo.id
        user_info.photo_id = nil
        user_info.save
      end      
      photo.destroy
      flash[:notice] = "Photo deleted!"
    else
      flash[:notice] = "You cannot delete other people's photos!"
    end
    redirect_to :back
  end

  def serve
    if params[:id] == "0"
      photo = File.open("public/photos/default.jpg").read
      send_data(photo, :content_type => "image/jpeg", :filename => "default.jpg", :disposition => "inline")
    else
      photo = Photo.find(params[:id])
      send_data(photo.binary.data, :content_type => photo.mime_type, :filename => photo.filename, :disposition => "inline")
    end
  end
end
