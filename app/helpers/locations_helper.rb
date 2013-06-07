module LocationsHelper

  # The number of locations to show per row (for screens with enough room).
  LOCATIONS_PER_ROW = 4

  # The relative width of a location (assuming Bootstrap's default grid system
  # with 12 units per row). Note that the width of each location is rounded down
  # if necessary.
  LOCATION_WIDTH = 12 / LOCATIONS_PER_ROW

end
