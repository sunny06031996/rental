class PropertiesController < ApplicationController
	#before_action :authenticate_request
	before_action :set_property, only: [:show, :update, :destroy]

	def index
    @properties = Property.all
		if @current_user.role.eql?"admin_user"
     	render 'properties/index_for_admin'
    else
    	render 'properties/index_for_user'
    end  	
  end


  def new
    render 'properties/new'
  end

  def create
    @property = Property.new(property_params)
    respond_to do |format|
	    if @property.save
	      format.html { redirect_to(@property, :notice => 'property was created successfully!') }
	    else 
	      format.html { render :action => "new" }
	    end
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
				# if params[:query].present?
		    # 	@properties = Property.all.where("name LIKE :search OR city LIKE :search OR  district LIKE :search ", search: "%#{params[:query]}%")