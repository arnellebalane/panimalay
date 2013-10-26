class PhotosController < ApplicationController
  def index
    @photo = Photo.new
    @photos = Photo.order("created_at DESC")
  end

	def create
		if (params[:photo][:photo])
  		valid_filetypes = ["jpg", "png", "jpeg", "bmp", "gif"];
      filetype = params[:photo][:photo].original_filename.split('.').last
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
          file.write(params[:photo][:photo].read)
        end
        photo = Photo.create(filename: filename, caption: params[:photo][:caption], user_id: session[:user_id])
        flash[:notice] = "Photo Uploaded!"
      else
        flash[:alert] = "Invalid File!"
      end
  	else
  		flash[:alert] = "Invalid File"
  	end
  	redirect_to :back
	end

  def get_user(user_id)
    return User.find(user_id)
  end

  def get_photo(photo_id)
    return User.find(photo_id)
  end
end
