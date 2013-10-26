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

  def get_photo
    photo = Photo.find(params[:id])
    result = {
      :photo => {
        :url => path_to_photo(photo.filename),
        :caption => photo.caption,
        :created_at => photo.created_at.strftime("%B %d, %Y")
      },
      :user => {
        :name => "#{photo.user.user_info.firstname} #{photo.user.user_info.lastname}"
      }
    }
    result[:user][:profile_picture] = if photo.user.user_info.photo_id.nil?
      path_to_photo "default.jpg"
    else
      path_to_photo Photo.find(photo.user.user_info.photo_id).filename
    end
    render :json => result
  end
end
