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

# Read the locations from the data file into a Ruby object
locations = YAML.load_file "#{Rails.root}/lib/locations.yml"

# Create a Location object for each location from the data file
locations.each do |location|
  Location.create!({
    name: location['name'],
    explanation: location['explanation'],
    weekday_start: Chronic.parse(location['weekday_start']),
    weekday_end: Chronic.parse(location['weekday_end']),
    weekend_start: Chronic.parse(location['weekend_start']),
    weekend_end: Chronic.parse(location['weekend_end'])
  })
end
