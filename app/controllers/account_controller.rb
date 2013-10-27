class AccountController < ApplicationController

	def index
		@user = User.find(session[:user_id]);
		@user_info = @user.user_info
		@comment = Comment.new
		@activities = @user.posts.order("created_at DESC")
    @activities += @user.photos.order("created_at DESC")
    @activities.sort_by!{|act| act.created_at}
		if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).id.to_s
    else
      @profpic = "0"
    end
    
    date_start = Date.today.beginning_of_week.yesterday
    date_end = Date.today.end_of_week.yesterday
    @events = Event.where(:event_date => date_start..date_end).order("event_date")
	end

	def show
		@user = User.find(params[:id]);
		@user_info = @user.user_info
		@comment = Comment.new
		@activities = @user.posts.order("created_at DESC")
    @activities += @user.photos.order("created_at DESC")
    @activities.sort_by!{|act| act.created_at}
		if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).id.to_s
    else
      @profpic = "0"
    end
		render :template => "account/index"
	end

	def settings
    @user = User.find(session[:user_id])
    @user_info = @user.user_info
    if @user_info.photo_id
			@profpic = Photo.find(@user_info.photo_id).id.to_s
		else
			@profpic = "0"
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
  		file_type = params[:user][:profile_picture].original_filename.split(".").last.downcase
      if ["png", "jpg", "jpeg", "gif", "bmp"].include? file_type
        myString = "thequickbrownfoxjumpsoverthelazydogTHEQUICKBROWNFOXJUMPSOVERTHELAZYDOG1234567890"
        filename = "#{Array.new(20) { myString[rand(myString.length)] }.join}.#{file_type}"
        while Photo.where(:filename => filename).count > 0
          filename = "#{Array.new(20) { myString[rand(myString.length)] }.join}.#{file_type}"
        end
        photo = Photo.create(
          :filename => filename,
          :caption => "",
          :user_id => session[:user_id],
          :mime_type => params[:user][:profile_picture].content_type
        )
        binary = Binary.create(:data => params[:user][:profile_picture].read, :photo_id => photo.id)
        @user_info[:photo_id] = photo.id
      else
        redirect_to :back, :alert => "Invalid format for profile picture!" and return
      end
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

  def accountabilities
    @user = User.find(session[:user_id]);
    @user_info = @user.user_info
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).id.to_s
    else
      @profpic = "0"
    end
    @months = %W(January February March April May June July August September October November December)
  end

  def photos
    @user = User.find(session[:user_id]);
    @user_info = @user.user_info
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).id.to_s
    else
      @profpic = "0"
    end
    @photos = Photo.order("created_at DESC")
  end

end
