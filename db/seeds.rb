# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'time'
require File.dirname(__FILE__) + '/../config/environment.rb'

# Set the time zone for Chronic
Chronic.time_class = Time.zone

# Parses a String with Chronic and returns a Time representation of it
#
# @param [String] time_string the string to parse (any valid Chronic string)
#
# @return [Time] the Time representation of the string created by Chronic
def parse_time time_string, at_start
  return nil if time_string.nil?
  time_string = at_start ? time_string.split('-').first.strip : time_string.split('-').last.strip
  Chronic.parse(time_string).seconds_since_midnight
end

# Create a Location object for each location from the data file
YAML.load_file("#{Rails.root}/lib/locations.yml").each do |location|
  Location.create!({
    name:          location['name'],
    explanation:   location['explanation'],
    weekday_start: [parse_time(location['weekdays'], true)],
    weekday_end:   [parse_time(location['weekdays'], false)],
    weekend_start: [parse_time(location['weekends'], true)],
    weekend_end:   [parse_time(location['weekends'], false)]
  })
end
