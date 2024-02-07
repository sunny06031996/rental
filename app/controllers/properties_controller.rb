class PropertiesController < ApplicationController
	#before_action :authenticate_request
	before_action :set_property, only: [:show, :update, :destroy]

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
    render 'properties/new'
  end

  def create
    @property = @current_user.properties.new(property_params)
    if @property.save
    	flash[:success] = "Property was created successfully!"
    	redirect_to properties_path(auth_token: params[:auth_token])
    else 
    	render 'properties/new'
    end 
  end

  def show
  	@property = Property.find(params[:id])
  end

  def update
    if @property.update(property_params)
    	respond_to do |format|
    		format.html { redirect_to(@property.id,
       :notice => 'Property was updated successfully !')}
    	end	
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
  end


  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:@property).permit(:rent_per_month, :city, :district, :beds_number, :name, :types, :mrt_line_station)
  end
end