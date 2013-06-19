# A Location at RIT. Every Location has a name, start/end times for its hours on
# weekdays/weekends, and an optional explanation (displayed in a tooltip in the
# view, if there is one). Location data should not frequently change at runtime,
# because the appropriate data is created in a database seed. If a location is
# always closed during weekdays and/or weekends, the appropriate times will be
# set to nil.
class Location < ActiveRecord::Base

  # Locations are sorted by name in alphabetical order.
  default_scope { order 'name ASC' }

  # Location names are mandatory, and should always be unique.
  #
  # TODO test validations
  validates :name,
    presence: true,
    uniqueness: true

  # A callback that runs before any Location is saved.
  before_save :adjust_times

  # Returns true if the Location is open at the given Time. This is likely the
  # most important method in the application.
  #
  # @param [Time] time the Time that the user wants to know if the Location is
  #   open during (defaults to the current time if it is not given)
  #
  # @return [Boolean] true if the Location is open at the given Time
  #
  # TODO refactor
  def open? time=Time.current
    # Figure out if the time is between the hours for the appropriate part of
    # the week
    part_of_week = Location.is_weekday?(time) ? :weekdays : :weekends
    return false unless open_on? part_of_week

    if part_of_week == :weekdays
      start_time = weekday_start
      end_time   = weekday_end
    elsif part_of_week == :weekends
      start_time = weekend_start
      end_time   = weekend_end
    end

    time = time.seconds_since_midnight

    logger.debug "Checking to see if #{time} is between #{start_time} and #{end_time}."

    # TODO find a better way to do this that won't break when moving between
    # weekdays and weekends
    hours = start_time...end_time
    hours.cover? time or hours.cover? time + 1.day
  end

  # Returns true if the Location is ever open during the appropriate part of the
  # week.
  #
  # @param [Symbol] part_of_week the part of the week that will be tested for
  #   any open times (:weekdays or :weekends)
  #
  # @raise [ArgumentError] if part_of_week is set to anything other than
  #   :weekdays or :weekends
  #
  # @return [Boolean] true if the Location is ever open during the appropriate
  #   part of the week
  #
  # TODO refactor
  def open_on? part_of_week
    if part_of_week == :weekdays
      not (weekday_start.nil? || weekday_end.nil?)
    elsif part_of_week == :weekends
      not (weekend_start.nil? || weekend_end.nil?)
    else
      raise ArgumentError
    end
  end

  private

  # Returns true if the given Time is on a weekday (Monday-Friday).
  #
  # @param [Time] time the Time to test (only its date matters)
  #
  # @return [Boolean] true if the Time is on a weekday
  def self.is_weekday? time
    (1..5) === time.wday
  end

  # A callback that runs before any Location is saved. This adds a day to end
  # times if needed to ensure that the end times are always after their matching
  # start times.
  #
  # TODO refactor
  def adjust_times
    if weekday_start && weekday_end
      self.weekday_end += 1.day if weekday_end < weekday_start
    end
    if weekend_start && weekend_end
      self.weekend_end += 1.day if weekend_end < weekend_start
    end
  end

end
