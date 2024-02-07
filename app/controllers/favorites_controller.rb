class FavoritesController < ApplicationController
	before_action :authenticate_request

	def create
    @property = Property.find(params[:property_id])
    @current_user.favorites.create(property: @property)
    redirect_to @property, notice: 'Added to favorites.'
	end

  def destroy
    @favorite = @current_user.favorites.find_by(property_id: params[:id])
    @favorite.destroy
    redirect_to @favorite.property, notice: 'Removed from favorites.'
  end
end