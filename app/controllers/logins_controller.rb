class LoginsController < ApplicationController

	skip_before_action :authenticate_request

	def new
		render 'login/login_form'
	end

	def login
		@account = User.find_by(email: params[:@user][:email])
		token = authenticate_account
		response.set_header('Authorization', "Bearer #{token}")
		redirect_to users_path(auth_token: token)
		redirect_to properties_path(auth_token: token)
	end 

	private
  def authenticate_account
    if @account.present?
      token = jwt_encode(user_id: @account.id)
      return token
    end
  end
end 