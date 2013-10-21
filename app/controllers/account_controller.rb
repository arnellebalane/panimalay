class AccountController < ApplicationController

	def index
		@user = User.find(session[:user_id]);
		@user_info = @user.user_info
		@comment = Comment.new
		@activities = @user.posts.order("created_at DESC")
		if @user_info.photo_id
			@profpic = Photo.find(@user_info.photo_id).filename
		else
			@profpic = "default.jpg"
		end
	end

	def show
		@user = User.find(params[:id]);
		@user_info = @user.user_info
		@comment = Comment.new
		@activities = @user.posts.order("created_at DESC")
		if @user_info.photo_id
			@profpic = Photo.find(@user_info.photo_id).filename
		else
			@profpic = "default.jpg"
		end
		render :template => "account/index"
	end

	def settings
    @user = User.find(session[:user_id])
    @user_info = @user.user_info
    if @user_info.photo_id
			@profpic = Photo.find(@user_info.photo_id).filename
		else
			@profpic = "default.jpg"
		end
  end

  def update
  	@user = User.find(session[:user_id])
  	@user_info = @user.user_info
  	if (params[:user][:email] != @user.email) 
  		Rails.logger.info "Nakasulod"
  		if (User.where("email = ?", params[:user][:email]).count <= 0) 
  			@user[:email] = params[:user][:email]  			
  		else 
  			flash[:alert] = "Email address is already taken!"
        redirect_to :back and return
  		end
  	end
  	if (params[:user][:password] != "")
	  	if (params[:user][:password] == params[:user][:password_confirmation]) 
	  		@user[:password] = params[:user][:password]	  		
	  	else 
	  		flash[:alert] = "Passwords does not match!"
        redirect_to :back and return
	  	end
  	end  	

  	if (params[:user][:profile_picture])
  		filetype = "." + params[:user][:profile_picture].original_filename.split('.').last
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
    		file.write(params[:user][:profile_picture].read)
  		end
  		profpic = Photo.create(filename: filename, caption: "", user_id: session[:user_id])
  		@user_info[:photo_id] = profpic.id
  	end  

  	@user_info[:firstname] = params[:user_info][:firstname]
  	@user_info[:lastname] = params[:user_info][:lastname]
  	@user_info[:student_number] = params[:user_info][:student_number]
  	@user_info[:elementary] = params[:user_info][:elementary]  	
  	@user_info[:nickname] = params[:user_info][:nickname]
  	@user_info[:course] = params[:user_info][:course]  	
  	@user_info[:birthday] = Date.civil(params[:birthday][:year].to_i, params[:birthday][:month].to_i, params[:birthday][:day].to_i)
    @user_info[:contact_number] = params[:user_info][:contact_number]
    @user_info[:address] = params[:user_info][:address]
    @user_info[:fathername] = params[:user_info][:fathername]
    @user_info[:mothername] = params[:user_info][:mothername]
    @user_info[:secondary] = params[:user_info][:secondary]
    @user_info[:college] = params[:user_info][:college]      
    @user_info[:bracket] = params[:bracket]
    @user_info[:year] = params[:year]
    @user_info[:guardianname] = params[:user_info][:guardianname]
    @user_info[:guardianaddress] = params[:user_info][:guardianaddress]
    @user_info[:guardiancontact_number] = params[:user_info][:guardiancontact_number]            
  	if @user_info.save and @user.save
  		flash[:notice] = "Account modified!"
  	else 
  		flash[:alert] = "Errors were encounted while changing personal information!"
  	end
  	redirect_to :back  	
  end  

end
