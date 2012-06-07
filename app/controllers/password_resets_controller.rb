class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	user.send_password_reset if user
  	redirect_to root_path
  	flash[:success] = "If your mail address has been recognized in our customer database an email has now been sent to you with password reset instructions."
  end

	def edit
  	@user = User.find_by_password_reset_token!(params[:id])
	end

	def update
	  @user = User.find_by_password_reset_token!(params[:id])
	  if @user.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path
	    flash[:error] = "Your session has expired, please reset your password again."
	  elsif @user.update_attributes(params[:user])
	    redirect_to root_url
	    flash[:success] = "Password has been reset."
	  else
	    render :edit
	  end
	end
end