class Property < ApplicationRecord
  enum types: { Residential: 0, Office: 1, Rental: 2 }
  validates :name, presence: true
  belongs_to :user

  #before_action :authorize_admin

  private 

  def authorize_admin
    unless @current_user&.admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end
end	
