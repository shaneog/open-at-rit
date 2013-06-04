class Location < ActiveRecord::Base

  attr_accessible :name, :explanation, :weekday_end, :weekday_start, :weekend_end, :weekend_start

  default_scope order 'name ASC'

  validates :name,
    presence: true,
    uniqueness: true

  TIME_FORMAT = '%l:%M %P'

  def open? time=Time.now
    if is_weekday? time
      return false unless open_weekdays?
      (weekday_start..weekday_end).cover? time
    else
      return false unless open_weekends?
      (weekend_start..weekend_end).cover? time
    end
  end

  def weekday_hours
    open_weekdays? ? "#{weekday_start.strftime TIME_FORMAT} to #{weekday_end.strftime TIME_FORMAT}" : 'closed'
  end

  def weekend_hours
    open_weekends? ? "#{weekend_start.strftime TIME_FORMAT} to #{weekend_end.strftime TIME_FORMAT}" : 'closed'
  end

  def <=> other_location
    name <=> other_location.name
  end

  def open_weekdays?
    not (weekday_start.nil? || weekday_end.nil?)
  end

  def open_weekends?
    not (weekend_start.nil? || weekend_end.nil?)
  end

  private

  def is_weekday? time
    not (time.saturday? || time.sunday?)
  end

end
