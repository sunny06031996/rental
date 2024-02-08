class HomesController < ApplicationController
	skip_before_action :authenticate_request
	def index
		render 'home/index'
	end
end