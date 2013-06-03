class Location < ActiveRecord::Base

  attr_accessible :name, :weekday_end, :weekday_start, :weekend_end, :weekend_start

  def open? time=Time.now
    if is_weekday? time
      @weekday_hours.cover? time
    else
      @weekend_hours.cover? time
    end
  end

  def <=> other_location
    @name <=> other_location.name
  end

  private

  def is_weekday? time
    not (time.saturday? || time.sunday?)
  end

end
