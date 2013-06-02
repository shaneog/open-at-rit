class Location < ActiveRecord::Base
  attr_accessible :name, :weekday_end, :weekday_start, :weekend_end, :weekend_start
end
