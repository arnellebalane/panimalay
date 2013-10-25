class PhotosController < ApplicationController
  def index
  end

  def show
    @user = User.find(session[:user_id]);
    @user_info = @user.user_info
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).filename
    else
      @profpic = "default.jpg"
    end
  end

	def create
		if (params[:photo][:photo])
  		filetype = "." + params[:photo][:photo].original_filename.split('.').last
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
  		photo = Photo.create(filename: filename, caption: "", user_id: session[:user_id])
  	else
  		flash[:alert] = "Invalid File"
  	end
  	redirect_to board_index_path
	end
end
