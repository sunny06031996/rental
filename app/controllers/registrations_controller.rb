class RegistrationsController < ApplicationController
	
	skip_before_action :authenticate_request


	def new
		render 'registration/sign_up_form'
  end

	def create
    user = User.new(user_params)
    user.save!
    redirect_to  new_login_path
  end

  private

  def user_params
  	params[:@user].permit(:name, :email,:role, :password,:password_confirmation)
  end 
end 