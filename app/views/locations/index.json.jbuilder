json.array! @locations do |location|
  json.extract! location, :id, :name, :weekdays, :weekends, :description
  json.open location.open?
  json.url location_url(location, format: :json)
end
