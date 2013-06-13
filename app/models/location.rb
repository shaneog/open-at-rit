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
    if Location.is_weekday? time
      return false unless open_on? :weekdays
      logger.debug "Checking to see if #{time} is between #{weekday_start} and #{weekday_end}."
      (weekday_start..(weekday_start < weekday_end ? weekday_end : weekday_end + 1.day)).cover? time
    else
      return false unless open_on? :weekends
      logger.debug "Checking to see if #{time} is between #{weekend_start} and #{weekend_end}."
      (weekend_start..(weekend_start < weekend_end ? weekend_end : weekend_end + 1.day)).cover? time
    end
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
