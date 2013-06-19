# Displays all Locations with both their preset and generated data.
class LocationsController < ApplicationController

  respond_to :html, :json

  # Displays all Locations in the database.
  #
  # GET /
  #
  # @return [String] the HTML for the list of Locations
  def index
    @locations = Location.all

    respond_with @locations
  end

end
