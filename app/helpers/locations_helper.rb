module LocationsHelper

  # The number of locations to show per row (for screens with enough room).
  LOCATIONS_PER_ROW = 4

  # The relative width of a location (assuming Bootstrap's default grid system
  # with 12 units per row). Note that the width of each location is rounded down
  # if necessary.
  LOCATION_WIDTH = 12 / LOCATIONS_PER_ROW

  TIME_FORMAT = '%l:%M %P'

  # TODO refactor
  def hours_for location, part_of_week
    return 'closed' unless location.open_on? part_of_week

    if part_of_week == :weekdays
      start_time = location.weekday_start
      end_time   = location.weekday_end
    elsif part_of_week == :weekends
      start_time = location.weekend_start
      end_time   = location.weekend_end
    else
      raise ArgumentError
    end

    start_time = start_time.localtime.strftime(TIME_FORMAT).strip
    end_time   = end_time.localtime.strftime(TIME_FORMAT).strip

    "#{start_time} to #{end_time}"
  end

end
