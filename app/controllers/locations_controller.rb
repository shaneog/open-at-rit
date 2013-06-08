class LocationsController < ApplicationController

  respond_to :html, :json

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

    respond_with @locations
  end

end
