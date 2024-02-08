class ApplicationController < ActionController::Base
  include JsonWebToken

  before_action :authenticate_request
  skip_before_action :verify_authenticity_token

  private
  def authenticate_request
    header = params[:auth_token]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find_by_id(decoded[:user_id])
  end
end
