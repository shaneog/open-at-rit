module LocationsHelper

  # The number of locations to show per row (for screens with enough room).
  LOCATIONS_PER_ROW = 4

  # The relative width of a location (assuming Bootstrap's default grid system
  # with 12 units per row). Note that the width of each location is rounded down
  # if necessary.
  LOCATION_WIDTH = 12 / LOCATIONS_PER_ROW

  TIME_FORMAT = '%l:%M %P'

  def weekday_hours_for location
    return 'closed' unless location.open_on? :weekdays

    start_time = location.weekday_start.localtime.strftime(TIME_FORMAT).strip
    end_time = location.weekday_end.localtime.strftime(TIME_FORMAT).strip
    "#{start_time} to #{end_time}"
  end

  def weekend_hours_for location
    return 'closed' unless location.open_on? :weekends

    start_time = location.weekend_start.localtime.strftime(TIME_FORMAT).strip
    end_time = location.weekend_end.localtime.strftime(TIME_FORMAT).strip
    "#{start_time} to #{end_time}"
  end

end
