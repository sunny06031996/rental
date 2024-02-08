class PropertiesController < ApplicationController
	before_action :set_property, only: [ :update,:edit,:show, :destroy]

	def index
		if @current_user.role.eql?"admin_user"
			@properties = @current_user.properties.all
     	render 'properties/index_for_admin'
    else
    	@properties = Property.all
    	render 'properties/index_for_user'
    end
  end

  def new
  	@property = Property.new
    render 'properties/new'
  end

  def show
 
  end

  def create
  	@property = @current_user.properties.new(property_params.merge(city: params["property"]["city"]&.downcase,
  	  district: params["property"]["district"]&.downcase))
    if @property.save
    	flash[:success] = "Property was created successfully!"
    	redirect_to properties_path(auth_token: params[:auth_token])
    else 
    	render 'properties/new'
    end 
  end

  def edit 
  	render 'properties/edit'
  end

  def update
    if @property.update(property_params)
    	redirect_to properties_path(auth_token: params[:auth_token])
    else
      redirect_to edit_property_path(@property, auth_token: params[:auth_token]) 
    end
  end

  def destroy
  	@property.destroy
    redirect_to properties_path(auth_token: params[:auth_token]), notice: 'Property was deleted successfully!'
  end

  def search_property
    @properties = Property.all
    filter_params = {}
    filter_params[:city] = normalize_data(params[:city]) if params[:city].present?
    filter_params[:district] = normalize_data(params[:district]) if params[:district].present?
    filter_params[:beds_number] = params[:beds_number].to_i if params[:beds_number].present?
    filter_params[:rent_per_month] = params[:rent_per_month].to_i if params[:rent_per_month].present?
    filter_params[:mrt_line_station] = params[:mrt_line_station] if params[:mrt_line_station].present?
    # byebug
    filter_params[:types] = params[:types].capitalize if params[:types].present?
    @properties = @properties.where(filter_params)
    render 'properties/index_for_user'
  end

  private

  def set_property
    @property = Property.find_by_id(params[:id])
  end

  def property_params
    params.require(:property).permit(:rent_per_month, :city, :district, :beds_number, :name, :types, :mrt_line_station)
  end

  def normalize_data(data)
    data&.downcase
  end
end