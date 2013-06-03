class Location < ActiveRecord::Base

  attr_accessible :name, :weekday_end, :weekday_start, :weekend_end, :weekend_start

  default_scope order 'name ASC'

  validates :name,
    presence: true,
    uniqueness: true

  def open? time=Time.now
    if is_weekday? time
      return false if weekday_hours.nil?
      weekday_hours.cover? time
    else
      return false if weekend_hours.nil?
      weekend_hours.cover? time
    end
  end

  def <=> other_location
    name <=> other_location.name
  end

  private

  def is_weekday? time
    not (time.saturday? || time.sunday?)
  end

end
