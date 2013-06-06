class LocationsController < ApplicationController

  respond_to :html, :json

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

    respond_with @locations
  end

  private

  def location_params
    params.require(:episode).permit(:name, :explanation, :weekday_end, :weekday_start, :weekend_end, :weekend_start)
  end

end
