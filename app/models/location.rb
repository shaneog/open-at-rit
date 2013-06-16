class Location < ActiveRecord::Base

  default_scope { order 'name ASC' }

  # TODO test validations
  validates :name,
    presence: true,
    uniqueness: true

  # TODO refactor
  before_save do
    Location.reset_date weekday_start
    Location.reset_date weekday_end
    Location.reset_date weekend_start
    Location.reset_date weekend_end

    self.weekday_end += 1.day if weekday_end < weekday_start
    self.weekend_end += 1.day if weekend_end < weekend_start
  end

  # TODO refactor
  def open? time=Time.now
    # Figure out if the time is between the hours for the appropriate part of
    # the week
    part_of_week = Location.is_weekday?(time) ? :weekdays : :weekends
    return false unless open_on? part_of_week

    # Set the time's date back to January 1, 2000 so we can do accurate
    # comparisons with it
    time = Location.reset_date time

    if part_of_week == :weekdays
      start_time = weekday_start
      end_time   = weekday_end
    elsif part_of_week == :weekends
      start_time = weekend_start
      end_time   = weekend_end
    else
      raise ArgumentError
    end

    logger.debug "Checking to see if #{time} is between #{start_time} and #{end_time}."
    (start_time..end_time).cover? time
  end

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

  def self.reset_date time
    time.change year: 2000, month: 1, day: 1
  end

  # TODO refactor
  def self.is_weekday? time
    not (time.saturday? || time.sunday?)
  end

end
