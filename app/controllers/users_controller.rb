class UsersController < ApplicationController
	#skip_before_action :authenticate_request

	def index
    @users = User.all
    render '/user/index'
  end
end 