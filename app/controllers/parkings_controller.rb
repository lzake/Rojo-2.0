class ParkingsController < ApplicationController
before_action :set_parking, except: [:index, :new, :create]
before_action :authenticate_user!, except: [:show]

  def index
    @parkings = current_user.parkings
  end

  def new
    @parking = current_user.parkings.build
  end

  def create
    @parking = current_user.parkings.build(parking_params)
    if @parking.save
      redirect_to listing_parking_path(@parking), notice: "Saved..."
    else
      render :new , notice: "Something went wrong..."
  end
end

  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def amenities
  end

  def location
  end

  def update
    if @parking.update(parking_params)
       flash[:notice] = "Saved..."
     else
       flash[:notice] = "Something went wrong..."
    end
     redirect_back(fallback_location: request.referer)
  end

  private
    def set_parking
      @parking = Parking.find(params[:id])
    end

  def parking_params
    params.require(:parking).permit(:space_type, :parking_type, :accommodate, :parking_spot, :parking_avail, :listing_name, :summary, :address, :is_lighting, :is_gated, :is_covered, :is_secure, :price, :active)
  end
end
