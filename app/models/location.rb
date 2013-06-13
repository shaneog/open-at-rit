class Location < ActiveRecord::Base

  default_scope { order 'name ASC' }

  validates :name,
    presence: true,
    uniqueness: true

  def open? time=Time.now
    # Set the time's date back to January 1, 2000 so we can do accurate
    # comparisons with it
    time = Time.mktime(2000, 1, 1, time.hour, time.min)

    # Figure out if the time is between the hours for the appropriate part of
    # the week
    # TODO: Don't add a day to the end Times on the fly, do it when the models
    # are saved
    part_of_week = Location.is_weekday?(time) ? :weekdays : :weekends
    return false unless open_on? part_of_week

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
    (start_time..(start_time < end_time ? end_time : end_time + 1.day)).cover? time
  end

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

  def self.is_weekday? time
    not (time.saturday? || time.sunday?)
  end

end
