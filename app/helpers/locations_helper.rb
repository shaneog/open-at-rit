# Provides helper methods for the application's models, views, and controllers.
module LocationsHelper

  # The number of locations to show per row (for screens with enough room).
  LOCATIONS_PER_ROW = 4

  # The relative width of a location (assuming Bootstrap's default grid system
  # with 12 units per row). Note that the width of each location is rounded down
  # if necessary.
  LOCATION_WIDTH = 12 / LOCATIONS_PER_ROW

  # The format string to use for displaying start/end times in views. Used by
  # strftime.
  TIME_FORMAT = '%l:%M %P'

  # Generates a text display of the hours (start and end time) of a given
  # location during either weekdays or weekends.
  #
  # @param [Location] location the Location to display hours for
  # @param [Symbol] part_of_week the time of the week for which the hours should
  #   be displayed during (:weekdays or :weekends)
  #
  # @raise [ArgumentError] if part_of_week is set to anything other than
  #   :weekdays or :weekends
  #
  # @return [String] the generated text of the Location's hours during the
  #   appropriate part of the week, in the format "START to END"
  #
  # TODO refactor
  def hours_for location, part_of_week
    return 'closed' unless location.open_on? part_of_week

    if part_of_week == :weekdays
      start_time = location.weekday_start
      end_time   = location.weekday_end
    elsif part_of_week == :weekends
      start_time = location.weekend_start
      end_time   = location.weekend_end
    end

    start_time = start_time.localtime.strftime(TIME_FORMAT).strip
    end_time   = end_time.localtime.strftime(TIME_FORMAT).strip

    "#{start_time} to #{end_time}"
  end

end
