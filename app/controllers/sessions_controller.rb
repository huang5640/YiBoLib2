class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(YiBoID: params[:session][:YiBoID])
	 if user && user.authenticate(params[:session][:password])
	 	## Log the user in and redirect to the user's show page
		session[:user_id] = user.id
		redirect_to books_url
	 else
	 	##Create an error message
      flash.now[:danger] = "Invalid YiBoID/password combination" 
	   render 'new'
	 end
  end

  def destroy
    log_out
	 redirect_to root_url
  end
end
