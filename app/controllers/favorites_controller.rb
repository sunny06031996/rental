class FavoritesController < ApplicationController

	def create
    @property = Property.find(params[:property_id])
    @current_user.favorites.create(property: @property)
    redirect_to properties_path(auth_token: params[:auth_token])
	end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    redirect_to properties_path(auth_token: params[:auth_token])
  end
end
